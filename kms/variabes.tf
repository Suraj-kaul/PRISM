variable "kms_description" {
  type        = string
  description = "The description of the key as viewed in AWS console"
  default     = null
}

variable "deletion_window_in_days" {
  type        = number
  default     = null
  description = "Duration in days after which the key is deleted after destruction of the resource"
}

variable "is_enabled" {
  type        = bool
  default     = null
  description = "Specifies whether the key is enabled"
}

variable "kms_policy" {
  type        = string
  sensitive   = true
  description = "A valid policy JSON document for KMS"
  default     = null
}

variable "customer_master_key_spec" {
  type        = string
  default     = null
  description = "Choose a valid key type"
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

variable "key_usage" {
  type        = string
  default     = null
  description = "Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY."
}

variable "tags" {
  description = "List of tags"
  default     = null
  type        = map(string)
}

variable "alias_name" {
  description = "The name of the key alias"
  type        = string
  default     = null
}

variable "Secret_data" {
  description = "Data to be encrypted. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
}

variable "kms_enabled" {
  type        = bool
  description = "Specifies whether to create resources within this module."
}

variable "enable_kms_ciphertext" {
  type        = bool
  description = "Specifies whether to create resources within this module."
}
