/*data "template_file" "proxy_policy" {
  template = file("./proxypolicy.json")

  vars = {
    secret_arn = var.secret_arn
    kms_key_arn = var.kms_key_arn
  }
}

resource aws_iam_policy secrets_access {
  policy = data.template_file.proxy_policy.rendered
}*/

data "aws_iam_policy_document" "proxy_policy" {
  statement {
    sid = "GetSecretValue"
    actions = [
      "secretsmanager:GetSecretValue",
    ]
    resources = ["${var.secret_arn}",]
  }
  statement {
    sid = "DecryptSecretValue"
    actions = [
      "kms:Decrypt",
    ]
    resources = ["${var.kms_key_arn}",]
    condition {
      test = "StringEquals"
      values = ["secretsmanager.us-east-1.amazonaws.com",]
      variable = "kms:ViaService"
    }
  }
}

resource "aws_iam_policy" "rds_proxy" {
  policy = data.aws_iam_policy_document.proxy_policy.json
}


resource "aws_iam_role" "rds_proxy" {
  name = var.role_name
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "rds.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  EOF

}
 resource "aws_iam_policy_attachment" "rds_proxy" {
   name = "${var.role_name}-attachment"
   policy_arn = aws_iam_policy.rds_proxy.arn
   roles = [aws_iam_role.rds_proxy.name]
 }
