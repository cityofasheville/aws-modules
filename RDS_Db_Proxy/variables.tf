variable "name" {
  type = string
  description = "The identifier for the proxy. This name must be unique for all proxies owned by your AWS account in the specified AWS Region. An identifier must begin with a letter and must contain only ASCII letters, digits, and hyphens; it can't end with a hyphen or contain two consecutive hyphens."
}

variable "engine_family" {
  type = string
  description = "The kinds of databases that the proxy can connect to. This value determines which database network protocol the proxy recognizes when it interprets network traffic to and from the database. The engine family applies to MySQL and PostgreSQL for both RDS and Aurora. Valid values are MYSQL and POSTGRESQL."
}

variable "debug_logging" {
  type = bool
  description = "Whether the proxy includes detailed information about SQL statements in its logs. This information helps you to debug issues involving SQL behavior or the performance and scalability of the proxy connections. The debug information includes the text of SQL statements that you submit through the proxy. Thus, only enable this setting when needed for debugging, and only when you have security measures in place to safeguard any sensitive information that appears in the logs."
  default = null
}

variable "idle_client_timeout" {
  type = number
  description = " The number of seconds that a connection to the proxy can be inactive before the proxy disconnects it. You can set this value higher or lower than the connection timeout limit for the associated database."
  default = null
}

variable "require_tls" {
  type = bool
  description = " A Boolean parameter that specifies whether Transport Layer Security (TLS) encryption is required for connections to the proxy. By enabling this setting, you can enforce encrypted TLS connections to the proxy."
  default = null
}

variable "role_arn" {
  type = string
  description = "The Amazon Resource Name (ARN) of the IAM role that the proxy uses to access secrets in AWS Secrets Manager."
  default = ""
}

variable "vpc_security_group_ids" {
  type = list(string)
  description = "The Amazon Resource Name (ARN) of the IAM role that the proxy uses to access secrets in AWS Secrets Manager."
  default = null
}

variable "vpc_subnet_ids" {
  type = list(string)
  description = "One or more VPC subnet IDs to associate with the new proxy. describe-db-parameters.html) after initial creation of the group."
  default = []
}

variable "tags" {
  type = map(string)
  default = {}
}

// auth block variables
variable "auth_scheme" {
  default = null
}

variable "auth_description" {
  default = null
}

variable "iam_auth" {
  description = "Either DISABLED or REQUIRED."
  default = null
}

variable "secret_arn" {
  default = null
}

variable "username" {
  description = "The name of the database user to which the proxy connects."
  default = null
}

variable "rds_instance" {
  default = null
}

variable "kms_key_id" {
  default = null
}
