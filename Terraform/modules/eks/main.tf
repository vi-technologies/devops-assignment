module aws_eks{
source                            = "terraform-aws-modules/eks/aws"
  version                         = "~> 20.0"
  cluster_name                    = var.name
  cluster_version                 = "1.29"
  cluster_endpoint_public_access  = true
  cluster_addons                  = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  vpc_id                          = var.vpc_id
  subnet_ids                      = var.subnet_ids
  control_plane_subnet_ids        = var.controlplane_subnet_ids
  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = var.default_eks_managed_node_groups
  }

  eks_managed_node_groups         = var.eks_managed_node_groups
  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = var.enable_cluster_admin_permissions

  tags = {
    environment = "vi-assignment"
    tf_managed  = "true"
  }
}