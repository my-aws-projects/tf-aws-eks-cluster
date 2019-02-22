output "eks_cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = "${aws_eks_cluster.eks.arn}"
}

output "eks_cluster_certificate_authority_data" {
  description = "The base64 encoded certificate data required to communicate with the cluster"
  value       = "${aws_eks_cluster.eks.certificate_authority.0.data}"
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the Kubernetes API server"
  value       = "${aws_eks_cluster.eks.endpoint}"
}

output "eks_sg_id" {
  description = "Security group ID of the EKS cluster"
  value       = "${aws_security_group.eks_sg.id}"
}

output "eks_cluster_version" {
  description = "The Kubernetes server version of the cluster"
  value       = "${aws_eks_cluster.eks.version}"
}

output "kubeconfig" {
  description = "Configuration to connect to the cluster using `kubectl`"
  value       = "${data.template_file.kubeconfig.rendered}"
}

output "iam_role_id" {
  description = "The Amazon Resource Name (ARN) specifying the role"
  value       = "${aws_iam_role.eks_cluster_role.arn}"
}
