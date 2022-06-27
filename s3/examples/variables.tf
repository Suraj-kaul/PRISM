variable "region" {
    description = "enter the region"
    type        = string
    default     = "us-east-1"
}
variable "profile" {
    description = "enter the profile"
    type        = string
    default     = "default"
}

variable "account_id" {
  description   = "enter the account id"
    type        = string
    default     = "731084091611"
}

variable "common_tags" {
  description = "A mapping of tags to assign to the kms key."
  type        = map(string)
  default     = null
}

variable "s3_tags" {
  description = "A mapping of tags to assign to the s3."
  type        = map(string)
  default     = null
}

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

variable "attach_policy" {
  description = "option to attach."
  type        = bool
  default     = false
}