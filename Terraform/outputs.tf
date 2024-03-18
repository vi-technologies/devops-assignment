output vpc_id {
  description = "VPC ID"
	value       = module.vi_assignment_jf.vpc_id
}

output "vpc_arn"{
	description	= "VPC ARN"
	value				= module.vi_assignment_jf.vpc_arn
}

output "vpc_cidr" {
	description = "VPC CIDR"
	value				=	module.vi_assignment_jf.vpc_cidr
}

output "private_subnets_id" {
	description = "List of private subnets id"
	value				= module.vi_assignment_jf.private_subnets_id
}

output "private_subnets_arn"{
	description = "List of private subnets arns"
	value				= module.vi_assignment_jf.private_subnets_arn
}

output "private_subnets_cidr" {
	description	= "List of CIDR blocks for private subnets"
	value				= module.vi_assignment_jf.private_subnets_cidr
}

output "public_subnets_id" {
	description = "List of private subnets id"
	value				= module.vi_assignment_jf.public_subnets_id
}

output "public_subnets_arn"{
	description = "List of private subnets arns"
	value				= module.vi_assignment_jf.public_subnets_arn
}

output "public_subnets_cidr" {
	description	= "List of CIDR blocks for private subnets"
	value				= module.vi_assignment_jf.public_subnets_cidr
}
