## DevOps Engineer Home Assignment
Below is a home assignment for the position. You are required to
1. Understand the situation and use case. You may contact the interviewer for further clarification.
2. Develop and run your deployment plan for BE Environment using your most efficient tools.
3. Bring your deployment and result to the next interview session.

### Situation
You are a DevOps engineer in the project of building an online order system. Your task is to deploy the prototype that completed by the development team and make it available to the internet.

Below is the information given by the development team

### Global environment requirement
- start a mongodb instance, reachable for the development team

### Starting the backend
- required nodejs 21
- set environment variable `MONGODB_URL="<mongodb connection url>"`, where `<mongodb connection url>` must match the [official mongodb node driver uri](https://docs.mongodb.com/drivers/node/current/fundamentals/connection/#connection-uri)
- navigate to package(s) directory `cd packages/<package>`
- build using npm `npm install`
- start using node `node index.js`

### Requirement
Your deployment must meet the following criteria:
- A working deployment which reachable through internet
- IAC (Infrastructure as Code) deployment for the created aws resources. You may use Cloudformation, Terraform or CDK for that purpose 
- Documentation for the deployment plan and the resources created

### Guidebook on completing this assignment
- Create dockerfiles to match the deployment needs.
- Create all following resources using IAC (Infrastructure as Code) tools
- Use [Amazon Elastic Container Registry](https://us-east-1.console.aws.amazon.com/ecr/get-started) to push the images to a private repository
- Create a [Kubernetes](https://us-east-1.console.aws.amazon.com/eks/home) cluster
- Use helm to deploy the service(s).
- Create a mongodb instance and make it reachable for the deployed service, update the `MONGODB_URL` environment variable to match the mongodb connection url 
- Expose the services to the internet using [AWS Load Balancer](https://us-east-1.console.aws.amazon.com/ec2/v2/home?region=us-east-1#LoadBalancers:sort=loadBalancerName)
- Document the deployment steps and the resources created in the deployment as clear and detailed as possible
- Bonus:
  - Supply the deployment with CI/CD automated process to push the image to ECR and deploy it to the cluster
  - Monitor the service and handle recovery for different resource
  - Maintain and handle the scaling of the service
  - Maintain and handle the availability of the service according to best practices
  - Secure the deployments according to best practices (rate limits, relevant security groups, etc)
  - Consider multi-tenant and multi-environment deployment 
  - Documentation for disaster recovery plan
  - Any other improvement you think is relevant

### How will the assignment be evaluated
When evaluating the assignment, we will consider the following:
- The deployment plan and the resources are created and working. we will trigger the API and will expect a valid response
- The documentation is clear and detailed, we will follow the documentation to understand the deployment process
