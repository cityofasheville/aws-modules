output "role_arn" {
  value = aws_iam_role.rds_proxy.arn
}


output "role_name" {
  value = aws_iam_role.rds_proxy.name
}

output "id" {
  value = aws_iam_role.rds_proxy.id
}
