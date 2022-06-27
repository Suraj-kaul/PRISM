 output "policy_arn" {
   description = "iam policy ARN"
   value       = aws_iam_policy.customer_policy.arn
 }

# output "role_name" {
#   description = "iam role name"
#   value       = aws_iam_role.lambda_role.name
# }

output "role_arn" {
  description = "iam role ARN"
  value       = aws_iam_role.lambda_role.arn
}