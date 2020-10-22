// security group variables
variable "vpc_id" {
  description = "VPC id to associate this RDS instance with."
}

variable "security_group_name" {
  default = null
}

variable "port" {
  default = null
}

variable "security_groups_for_ingress" {
  description = "Security groups which should be allowed ingress on the RDS instance."
  default     = []
}

variable "sg_cidr_blocks" {
  description = "cidr_blocks to give RDS port access to."
  default     = []
}

variable "ingress" {
  default = {}
}

variable "egress" {
  default = {}
}

variable "tags" {
  default = {}
}
