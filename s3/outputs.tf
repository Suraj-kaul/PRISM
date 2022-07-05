output "s3_bucket_id" {
  description = "s3 bucet name"
  value       = aws_s3_bucket.this.id
}

output "s3_arn" {
  description = "S3 bucket arn"
  value = aws_s3_bucket.this.arn
}