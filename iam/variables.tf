variable "role_name" {
  description = "Enter the role name"
  type = string
}

variable "assume_role_policy" {
  description = "iam role"
  type        = string
}

variable "tags" {
  description = "List of tags"
  default = {}
  type = map(string)
}

variable "aws_managed_policy" {
 description = "AWS managed policy arns to attach with iam role"
 type        = list
}

variable "policy_name" {
  description = "Enter the policy name"
  type = string
}

variable "iam_description" {
  description = "policy description"
  type        = string
}

variable "policy" {
  description = "iam policy for role"
  type        = string
}