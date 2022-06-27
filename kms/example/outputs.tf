output "key_id" {
  value       = try(module.kms_key.key_id, null)
  description = "Key ID"
}

output "key_arn" {
  value       = try(module.kms_key.key_arn, null)
  description = "Key ARN"
}