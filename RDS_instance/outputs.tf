output "endpoint" {
  value = aws_db_instance.rds_instance.endpoint
  //address:port format
}

output "address" {
  value = aws_db_instance.rds_instance.address
}

output "family" {
  value = local.family
}

output "master_username" {
  value = aws_db_instance.rds_instance.username
}

output "db_name" {
  value = aws_db_instance.rds_instance.name
}

output "name" {
  value = var.name
}

output "port" {
  value = var.port
}

output "rds_id" {
  value = aws_db_instance.rds_instance.id
}

output "identifier" {
  value = var.identifier
}
output "secret_arn" {
  value = module.Secrets.arn
}
