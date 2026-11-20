provider "aws" {
  region = "ap-south-1"
}

variable "s3_read_policy" {
  description = "Policy allowing read-only access to S3"
  default = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:ListAllMyBuckets",
          "s3:GetBucketLocation",
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Resource = "*"
      }
    ]
  }
}

resource "aws_iam_user" "s3_reader" {
  name = "terraform-s3-reader"
}

resource "aws_iam_policy" "s3_read_policy" {
  name        = "Terraform-S3-ReadOnly-Policy"
  description = "Read-only access to Amazon S3"

  policy = jsonencode(var.s3_read_policy)
}

resource "aws_iam_user_policy_attachment" "attach_s3_policy" {
  user       = aws_iam_user.s3_reader.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}
