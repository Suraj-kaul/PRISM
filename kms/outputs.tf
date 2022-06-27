output "key_id" {
  value       = try(join("", aws_kms_key.this.*.key_id), "")
  description = "The key id of kms"
}

output "key_arn" {
  value       = try(join("",aws_kms_key.this.*.arn), "")
  description = "Key ARN"
}