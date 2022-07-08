resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  acl    = var.bucket_acl != "null" ? var.bucket_acl : null
  versioning {
    enabled = var.versioning_enable
    mfa_delete = "Enabled"

  }
  tags = var.tags
}

resource "aws_s3_bucket_policy" "this" {
  count = var.attach_policy ? 1 : 0

  bucket = aws_s3_bucket.this.id
  policy = var.bucket_policy
}
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_arn 
      sse_algorithm     = var.sse_algorithm 
    }
  }
}