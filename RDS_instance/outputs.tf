output "endpoint" {
  value = aws_db_instance.mod.endpoint
  //address:port format
}

output "address" {
  value = aws_db_instance.mod.address
}

output "family" {
  value = local.family
}

output "master_username" {
  value = aws_db_instance.mod.username
}

output "db_name" {
  value = aws_db_instance.mod.name
}

output "name" {
  value = var.name
}

output "port" {
  value = var.port
}

output "rds_id" {
  value = aws_db_instance.mod.id
}
