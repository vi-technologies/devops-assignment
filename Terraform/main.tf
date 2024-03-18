terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

data "aws_region" "current" {}

provider "aws" {
  region                   = "eu-north-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "vi"
}


module "vi_assignment_jf"{
source  				= "./modules/vpc"
	vpc_name			= "vi_assignment_jf"
	cidr				= "10.0.0.0/16"
	availability_zones	=	["${data.aws_region.current.name}a", "${data.aws_region.current.name}b", "${data.aws_region.current.name}c"]
	private_subnets	    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
	public_subnets		= ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
	nat_gw				= true
	vpn_gw				= true
}
