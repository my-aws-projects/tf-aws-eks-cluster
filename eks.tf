locals {
  tag_based_name   = "${lookup(var.tags,"prefix", "")}-${lookup(var.tags,"role", "")}"
  eks_cluster_name = "${var.eks_cluster_name == "" ? local.tag_based_name : var.eks_cluster_name}"
}


# EKS Cluster
resource "aws_eks_cluster" "eks" {
  name     = "${local.eks_cluster_name}"
  role_arn = "${aws_iam_role.eks_cluster_role.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.eks_sg.id}"]
    subnet_ids         = ["${var.subnet_ids}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.eks_cluster_policy",
    "aws_iam_role_policy_attachment.eks_service_policy",
  ]
}

# Kubeconfig
data "template_file" "kubeconfig" {
  template = "${file("${path.module}/templates/kubeconfig.tpl")}"

  vars {
    server                     = "${aws_eks_cluster.eks.endpoint}"
    certificate_authority_data = "${aws_eks_cluster.eks.certificate_authority.0.data}"
    cluster_name               = "${local.eks_cluster_name}"
  }
}
