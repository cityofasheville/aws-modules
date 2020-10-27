
resource "aws_iam_role" "rds_proxy" {
  assume_role_policy = "arn:aws:iam::518970837364:policy/service-role/rds-proxy-policy-1603473708798"
  name       = var.role_name

  force_detach_policies = false
  tags = var.tags
}
