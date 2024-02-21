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
- you may set an optional environment variable `PORT="<server running port>"` to change the default server port (default: 3000)
- navigate to backend directory `cd backend`
- build using npm `npm install`
- start using node `node index.js`

### Requirement
Your deployment must meet the following criteria:
- A working deployment which reachable through internet
- IAC (Infrastructure as Code) deployment for the created aws resources. Yoy may use Cloudformation or Terraform for that purpose 
- Documentation for the deployment plan and the resources created

### Guidebook on completing this assignment
- Create a dockerfile to match the development request
- Create all following resources using IAC (Infrastructure as Code) tools
- Use [Amazon Elastic Container Registry](https://us-east-1.console.aws.amazon.com/ecr/get-started) to push the images to a private repository
- Create a [Kubernetes](https://us-east-1.console.aws.amazon.com/eks/home) cluster to deploy the service
- Create a mongodb instance and make it reachable for the deployed service, update the `MONGODB_URL` environment variable to match the mongodb connection url 
- Expose the service to the internet using [AWS Load Balancer](https://us-east-1.console.aws.amazon.com/ec2/v2/home?region=us-east-1#LoadBalancers:sort=loadBalancerName)
- Document the deployment steps and the resources created in the deployment as clear and detailed as possible
- Bonus:
  - Supply the deployment with CI/CD automated process to push the image to ECR and deploy it to the cluster
  - Monitor the service and handle recovery for different resource
  - Maintain and handle the scaling of the service
  - Maintain and handle the availability of the service according to best practices
