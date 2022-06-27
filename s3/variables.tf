variable "bucket_name" {
  description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = "my-bucket-454545444"
}

variable "bucket_acl" {
  description = "(Optional) The canned ACL to apply. Defaults to 'private'. Conflicts with `grant`"
  type        = string
  default     = "private"
}

variable "bucket_policy" {
  description = "The text of the policy."
  type        = string
}

variable "attach_policy" {
  description = "option to attach."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A mapping of tags to assign to the object."
  type        = map(string)
  default     = {}
}