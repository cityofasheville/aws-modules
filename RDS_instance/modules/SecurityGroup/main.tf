resource "aws_security_group" "sg_on_rds_instance" {
  description = var.security_group_name
  name        = var.security_group_name
  vpc_id      = var.vpc_id

  ingress = {var.ingress}

  egress ={ var.egress}

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
