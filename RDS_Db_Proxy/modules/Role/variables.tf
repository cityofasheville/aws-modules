variable "role_name" {
  default = null
}

variable "tags" {
  type = map(string)
  default = {}
}

variable "secret_arn" {
  default = ""
}

variable "kms_key_arn" {
  default = ""
}

