resource "aws_iam_role" "this" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

## bucket policy
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.this.arn]
    }

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${module.s3_bucket.s3_bucket_id}",
    ]
  }
}

## S3 module 
module "s3_bucket" {
  source = "../"

  bucket_name        = var.bucket_name 
  bucket_acl         = var.bucket_acl
  attach_policy      = var.attach_policy
  bucket_policy      = data.aws_iam_policy_document.bucket_policy.json

  tags = merge(var.common_tags, var.s3_tags) 
  }