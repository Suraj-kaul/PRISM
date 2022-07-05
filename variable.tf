variable "bucket_name" {
    type = map(any)
    description = "Bucket values"
}

variable "aws_managed_policy" {
    type = list
    description = "managed policy"
    default = []
}

# variable "datalake_data_prefix" {
#   type = string
# }
##KMS
variable "account_id" {
  description   = "enter the account id"
  type        = string
}
variable "common_tags" {
  description = "A mapping of tags to assign to the kms key."
  type        = map(string)
  default     = null
}

variable "kms_tags" {
  description = "A mapping of tags to assign to the kms key."
  type        = map(string)
  default     = null
}

variable "kms_description" {
  type        = string
  description = "The description of the key as viewed in AWS console"
  default     = null
}

variable "deletion_window_in_days" {
  type        = number
  description = "Duration in days after which the key is deleted after destruction of the resource"
  default     = null
}

variable "customer_master_key_spec" {
  type        = string
  description = "Choose a valid key type"
  default     = null
}

variable "key_usage" {
  type        = string
  description = "Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY."
  default     = null
}

variable "is_enabled" {
  type        = bool
  default     = null
  description = "Specifies whether the key is enabled"
}

variable "enable_key_rotation" {
  type        = bool
  default     = null
  description = "Specifies whether key rotation is enabled"
}
 
variable "multi_region" {
  type        = bool
  default     = null
  description = "Indicates whether the KMS key is a multi-Region (true) or regional (false) key"
}

variable "alias_name" {
  description = "The name of the key alias"
  type        = string
  default     = null
}

variable "Secret_data" {
  description = "Data to be encrypted. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
  default = ""
}

variable "kms_enabled" {
  type        = bool
  description = "Specifies whether to create resources within this module."
}

variable "enable_kms_ciphertext" {
  type        = bool
  description = "Specifies whether to create resources within this module."
}
