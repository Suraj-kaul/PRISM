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
  default = ""
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
variable "versioning_enable"{
  type = bool
  default = false
}
variable "kms_arn" {
  type = string
  description = "kms key arn"
  default = null
}

variable "sse_algorithm"{
  type = string
  default = "aws:kms"
  description = "value supported aws:kms or AES256"
}