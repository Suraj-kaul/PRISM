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
  default = ""
}

variable "iam_description" {
  description = "policy description"
  type        = string
  default = ""
}

variable "policy" {
  description = "iam policy for role"
  type        = string
  default = null
}
variable "create_iam_policy" {
  type = bool
  description = "(optional) describe your variable"
  default = true
}