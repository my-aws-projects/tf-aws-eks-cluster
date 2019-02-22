# Default EKS security group
resource "aws_security_group" "eks_sg" {
  name        = "${local.eks_cluster_name}-sg"
  description = "Security Group for ${local.eks_cluster_name} EKS cluster"
  vpc_id      = "${var.vpc_id}"
  tags        = "${var.tags}"
}

resource "aws_security_group_rule" "egress" {
  description       = "Allow all egress traffic"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.eks_sg.id}"
  type              = "egress"
}
