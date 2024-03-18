output vpc_id {
  description = "VPC ID"
	value       = module.aws_vpc.vpc_id
}

output "vpc_arn"{
	description	= "VPC ARN"
	value				= module.aws_vpc.vpc_arn
}

output "vpc_cidr" {
	description = "VPC CIDR"
	value				=	module.aws_vpc.vpc_cidr_block
}

output "private_subnets_id" {
	description = "List of private subnets id"
	value				= module.aws_vpc.private_subnets
}

output "private_subnets_arn"{
	description = "List of private subnets arns"
	value				= module.aws_vpc.private_subnet_arns
}

output "private_subnets_cidr" {
	description	= "List of CIDR blocks for private subnets"
	value				= module.aws_vpc.private_subnets_cidr_blocks
}

output "public_subnets_id" {
	description = "List of private subnets id"
	value				= module.aws_vpc.public_subnets
}

output "public_subnets_arn"{
	description = "List of private subnets arns"
	value				= module.aws_vpc.public_subnet_arns
}

output "public_subnets_cidr" {
	description	= "List of CIDR blocks for private subnets"
	value				= module.aws_vpc.public_subnets_cidr_blocks
}
