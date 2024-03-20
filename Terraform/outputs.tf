##### VPC #####
output vpc_id {
  description = "VPC ID"
	value     = module.vpc_jf.vpc_id
}

output "vpc_arn"{
	description	= "VPC ARN"
	value		= module.vpc_jf.vpc_arn
}

output "vpc_cidr" {
	description = "VPC CIDR"
	value		=	module.vpc_jf.vpc_cidr
}

output "private_subnets_id" {
	description = "List of private subnets id"
	value		= module.vpc_jf.private_subnets_id
}

output "private_subnets_arn"{
	description = "List of private subnets arns"
	value		= module.vpc_jf.private_subnets_arn
}

output "private_subnets_cidr" {
	description	= "List of CIDR blocks for private subnets"
	value		= module.vpc_jf.private_subnets_cidr
}

output "public_subnets_id" {
	description = "List of private subnets id"
	value		= module.vpc_jf.public_subnets_id
}

output "public_subnets_arn"{
	description = "List of private subnets arns"
	value		= module.vpc_jf.public_subnets_arn
}

output "public_subnets_cidr" {
	description	= "List of CIDR blocks for private subnets"
	value		= module.vpc_jf.public_subnets_cidr
}
##### VPC #####

##### EKS #####
output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster"
  value       = module.eks_jf.cluster_arn
}

output "cluster_endpoint" {
  description = "Endpoint for your Kubernetes API server"
  value       = module.eks_jf.cluster_endpoint
}

output "cluster_id" {
  description = "The ID of the EKS cluster. Note: currently a value is returned only for local EKS clusters created on Outposts"
  value       = module.eks_jf.cluster_id
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks_jf.cluster_name
}

output "cluster_version" {
  description = "The Kubernetes version for the cluster"
  value       = module.eks_jf.cluster_version
}

output "cluster_primary_security_group_id" {
  description = "Cluster security group that was created by Amazon EKS for the cluster. Managed node groups use this security group for control-plane-to-data-plane communication. Referred to as 'Cluster security group' in the EKS console"
  value       = module.eks_jf.cluster_primary_security_group_id
}

output "cluster_iam_role_name" {
  description = "IAM role name of the EKS cluster"
  value       = module.eks_jf.cluster_iam_role_name
}

output "cluster_iam_role_arn" {
  description = "IAM role ARN of the EKS cluster"
  value       = module.eks_jf.cluster_iam_role_arn
}

output "eks_managed_node_groups" {
  description = "Map of attribute maps for all EKS managed node groups created"
  value       = module.eks_jf.eks_managed_node_groups
}
##### EKS ######


##### ECR ######
output "ecr_repository_service1_url" {
  description = "the URL of service1 repo in ECR"
  value       = aws_ecr_repository.service1.repository_url
}

output "ecr_repository_service2_url" {
  description = "the URL of service1 repo in ECR"
  value       = aws_ecr_repository.service2.repository_url
}
##### ECR ######
