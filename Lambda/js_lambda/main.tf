locals {
  lambda_src_path = "${path.module}${var.lambda_relative_path}lambda"
}

resource "random_uuid" "lambda_src_hash" {
  keepers = {
  for filename in setunion(
  fileset(local.lambda_src_path, "*.js"),
  fileset(local.lambda_src_path, "*.json")
  ):
  filename => filemd5("${local.lambda_src_path}/${filename}")
  }
}

# Create an archive form the Lambda source code,
# filtering out unneeded files.
data "archive_file" "lambda_source_package" {
  type        = "zip"
  source_dir  = local.lambda_src_path
  output_path = "${path.module}/.tmp/${random_uuid.lambda_src_hash.result}.zip"

  excludes    = [
    "node_modules",
    "README.md",
    "tests",
    "docs"
  ]

}

resource "aws_iam_role" "execution_role_for_lambda" {
  name = var.lambda_role
  assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
]
}
EOF
}

# Attach a IAM policy to the execution role to allow
# the Lambda to stream logs to Cloudwatch Logs.
resource "aws_iam_role_policy" "lambda_policy" {
  name = "${var.function_name}-policy"
  role = aws_iam_role.execution_role_for_lambda.id

  policy = jsonencode(var.policy_statement)
}



resource "aws_lambda_function" "new_lambda" {
  filename      = var.deploy_file_name !="" ? var.deploy_file_name : data.archive_file.lambda_source_package.source_content_filename
  function_name = var.function_name
  description = var.lambda_description
  role          = var.service_role !="" ? var.service_role : aws_iam_role.execution_role_for_lambda.arn
  handler       = var.lambda_handler

  memory_size = var.memory_size
  timeout = var.timeout
  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = var.deploy_file_name !="" ? filebase64sha256(var.deploy_file_name) : data.archive_file.lambda_source_package.output_base64sha256

  runtime = var.runtime

  vpc_config {
    security_group_ids = var.lambda_security_groups
    subnet_ids = var.lambda_subnets
  }
  environment {
    variables = var.enviroment_vars
  }

  tags = var.tags

}

