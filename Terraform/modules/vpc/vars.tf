variable vpc_name {
  type        = string
	description = "name of the VPC"
}

variable cidr {
	type        = string
	default     = "10.0.0.0/16"
	description = "cidr of the vpc"
}

variable availability_zones {
	type				= list
}

variable private_subnets{
	type 				= list
	description = "list of private subnets"
}

variable public_subnets{
	type 				= list
	description = "list of public subnets"
}

variable nat_gw{
	type = bool
}

variable vpn_gw{
	type = bool
}
