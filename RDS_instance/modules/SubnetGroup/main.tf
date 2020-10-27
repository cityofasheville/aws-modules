resource "aws_db_subnet_group" "subnet_group" {
  count       = var.create_db_subnet_group ? 1 : 0
  description = var.description
  name        = var.subnet_group_name
  subnet_ids  = flatten([var.subnets])
  tags        = var.tags

  lifecycle {
    create_before_destroy = true

    # Apparently subnet groups cannot be changed within the same VPC. Even
    # though the AWS documentation says otherwise.
    # http://serverfault.com/a/817598
    ignore_changes = [name]
  }
}
