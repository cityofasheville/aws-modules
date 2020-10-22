
resource "aws_iam_role" "rds_enhanced_monitoring" {
  assume_role_policy = data.aws_iam_policy_document.rds_enhanced_monitoring.json
  name_prefix        = "rds-enhanced-monitoring"
}

resource "aws_iam_role_policy_attachment" "rds_enhanced_monitoring" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = aws_iam_role.rds_enhanced_monitoring.name
}

data "aws_iam_policy_document" "rds_enhanced_monitoring" {

  statement {
    actions = [
      "sts:AssumeRole",
    ]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
  }
}
