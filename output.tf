# output "s3_id" {
#     value = {for k,v in module.s3_bucket: k=>v.s3_bucket_id}
# }

# output "s3_arn" {
#     value = {for k, v in module.s3_bucket:k=>v.s3_arn}
# }

# output "kms_key_Arn" {
#     value = module.kms_key.key_arn
# }