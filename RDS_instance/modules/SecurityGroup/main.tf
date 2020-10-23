resource "aws_security_group" "sg_on_rds_instance" {
  description = var.description
  name        = var.name
  vpc_id      = var.vpc_id

  ingress = {
    cidr_blocks     = var.cidr_blocks
    from_port       = var.port
    protocol        = "tcp"
    security_groups = var.security_groups
    to_port         = var.port
  }

  egress = {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  tags = merge(
  {
    "Name" = var.security_group_name
  },
  var.tags,
  )

  lifecycle {
    create_before_destroy = true
  }
}
