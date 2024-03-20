# Introduction

This is a repository with the following components:

- Code Packages
- Terraform
- Helm Charts & Kubernetes manifests
- Github Actions CI

## Code Packages
All code packages have a dockerfile.
### Service1
Service1 is a order management API which runs on port 3000.
it connects to a MongoDB service via env var MONGODB_URL.
Service1 receives 3 types of API Methods: GET, POST, DELETE
As well it routes on the following paths:
- /health - returns "healthy" if the service is up. (GET)
- /orders - creates a new order (POST)
- /orders/{id} - receives an order id and deletes it (DELETE) 
### Service2
Service2 is an API endpoint that returns all existing orders on the database.
This service runs port 3001.
it connects to a MongoDB service via env var MONGODB_URL.
Service2 receives 1 types of API Method: GET
As well it routes on the following paths:
- /health - returns "healthy" if the service is up. (GET)
- /orders - returns orders from the database (GET)
## Terraform
The terraform code uses the following modules:
- terraform-aws-modules/eks/aws
- terraform-aws-modules/vpc/aws
as well as the following resource:
- aws_ecr_repository
- 
*all resources are tagged with tf_managed & environment.*

### Networking
1. A VPC with CIDR 10.0.0.0/16 spread on 3 availability zones
2. 3 private subnets
3. 3 public subnets with auto-attachment of elastic-ips
4. Internet gateway
5. Nat Gateway per Public Subnet

### EKS
1. EKS multi-az with 2 managed scalable node groups with size t3.medium
	1. Spot
	2. On Demand
2. Control plane which runs on private subnets
3. the rest of the nodes run on the public subnets
4. Kube-Proxy, CoreDNS & VPC-CNI enabled
  
### ECR
1. creates 2 private repositories:
	1. service1
	2. service2

## Helm & Kubernetes
The Kubernetes folder contains the following:
**Helm Charts**
1. Service1:
	-  deployment - Contains readiness & liveness probes, as well as configmap env.
	- service - Loadbalancer
	- hpa - Scales from 1 to 5
2. Service2:
	- deployment - Contains readiness & liveness probes, as well as configmap env.
	- service - Loadbalancer
	- hpa -  Scales from 1 to 5

**Kubernetes Manifests**
1. MongoDB configuration - Creates a pod, a service & a configmap for the mongodb database.
2. ECR Registry image pull secret - regcred.yaml, contains the data to pull from the private ECR registries.
3. metrics-server - The metrics server that the HPA relies on in order to read pod metrics.
  

## Github Actions CI
### Prerequisites
- Environment in GitHub called "dev" which contains:
	1. Environment variables
	   * AWS_ACCOUNT key with your aws account number
	   * AWS_REGION key with the region you have your ECR
	1. Secrets
	   - AWS_ACCESS_KEY key with value of your aws access key
	   - AWS_SECRET_KEY with value of your aws secret access key
### Operations
The CI is split into 2 jobs, each for a service.
**build-service-1**
- Runs on ubuntu
- Checkout of the repo
- gets ECR credentials
- Builds local docker image with tag `:latest`
- Tags it with ECR url as `:latest` and unix-timestamp
- pushes to ECR

**build-service-2**
- Runs on ubuntu
- Checkout of the repo
- gets ECR credentials
- Builds local docker image with tag `:latest`
- Tags it with ECR url as `:latest` and unix-timestamp
- pushes to ECR

# How to run this?
1. Configure your AWS profile under the name "vi". `aws configure --profile vi`
2. Run `terraform init`, `terraform plan`, `terraform apply`
3. Trigger the CI to build an image & push to the ECR. make sure to configure all the environment variables/secrets.
4. Get the kubernetes configuration via aws cli. `aws eks update-kubeconfig --region region-code --name my-cluster`
5. apply all the kubernetes manifests via kubectl `kubectl apply -f Kubernetes/manifests/.`
6. run the helm charts.
   `helm install service1 Kubernetes/service1/.`
   `helm install service1 Kubernetes/service2/.`
7. Wait for the loadbalancers in aws o finish creating
8. run `kubectl get svc | grep service | awk '{print $1":", "\nExternal Address: "$4}'`
9. attempt to access the services via http://
  

# FAQ

**I've deployed everything, but my HPA says \<unknown\>/80%. Why is this happening?**
> Please make sure you have deployed the metrics-server under Kubernetes/manifests/metrics-server.yaml. 
> run from the root folder: `kubectl apply -f Kubernetes/manifests/metrics-server.yaml`

**I'm getting this error in Terraform: failed to get shared config profile, vi**
> Please make sure to create an aws profile with the name "vi" in order to run this.
> for example: `aws configure --profile vi`


  

# How can this be improved?

## Infrastructure
A light-pilot environment with minimal resources running in the background with DNS failover in the case the main environment falls/stolen (Different Account + Different Region)

## CI/CD
- run Terraform via CD (github actions)
- Use the terraform outputs to get the ECR repository urls after terraform apply to
  run a replacement on the helm templates values for the ECR url for a dynamic run (in case of a tenant based architecture where each gets his own repositories)
- Use ArgoCD for deploying the helm templates & kubernetes manifests

## Helm
Utilize global values for helm & subcharting for a DRY-er charting.

