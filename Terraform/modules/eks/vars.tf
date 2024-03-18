variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "controlplane_subnet_ids" {
  type = list(string)
}

variable "default_eks_managed_node_groups" {
  type = list(string)
}

variable "eks_managed_node_groups" {
  type = map(object({
    min_size       = number
    max_size       = number
    desired_size   = number
    instance_types = list(string)
    capacity_type  = string
  }))
}

variable "enable_cluster_admin_permissions" {
  type    = bool
  default = true
}
