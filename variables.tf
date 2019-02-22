# EKS variables
variable "eks_cluster_name" {
  description = "The Name of the cluster (up to 255 letters, numbers, hyphens, and underscores). This name will also be use to set the tag `eks_cluster`."
  default     = ""
  type        = "string"
}

# Common variables
variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch resources in"
  type        = "list"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = "map"
}
