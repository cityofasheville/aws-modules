output "role_arn" {
  value = aws_iam_role.rds_enhanced_monitoring.arn
}


output "role_name" {
  value = aws_iam_role.rds_enhanced_monitoring.name
}

output "id" {
  value = aws_iam_role.rds_enhanced_monitoring.id
}
