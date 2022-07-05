output "s3_id" {
    value = {for k,v in module.s3_bucket: k=>v.s3_bucket_id}
}

output "s3_arn" {
    value = {for k, v in module.s3_bucket:k=>v.s3_arn}
}

# output "IAM_role_arn" {
#     value = module.iam_role_policy.role_arn
# }
output "kms_key_Arn" {
    value = module.kms_key.key_arn
}