// security group variables
variable "vpc_id" {
  description = "VPC id to associate this RDS instance with."
}

variable "security_group_name" {
  default = null
}

variable "name" {
  type = string
  default = ""
}

variable "description" {
  type = string
  default = ""
}

variable "port" {
  default = null
}

variable "security_groups" {
  type = list(string)
  description = "Security groups which should be allowed ingress on the RDS instance."
  default     = []
}

variable "cidr_blocks" {
  type = list(string)
  description = "cidr_blocks to give RDS port access to."
  default     = []
}

variable "tags" {
  default = {}
}
