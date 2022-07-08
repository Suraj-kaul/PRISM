variable "common_tags" {
  description = "A mapping of tags to assign to the kms key."
  type        = map(string)
  default     = {}
}


# variable "bucket_name" {
#     type = map(any)
#     description = "Bucket values"
# }



# # variable "datalake_data_prefix" {
# #   type = string
# # }


# ##KMS
# variable "athena_tags" {
#   type = map(string)
#   description = "(optional) describe your variable"
#   default = {}
# }

# variable "sftp_tags" {
#   type = map(string)
#   description = "(optional) describe your variable"
#   default = {}
# }

# variable "account_id" {
#   description   = "enter the account id"
#   type        = string
# }


# variable "kms_tags" {
#   description = "A mapping of tags to assign to the kms key."
#   type        = map(string)
#   default     = {}
# }

# variable "kms_description" {
#   type        = string
#   description = "The description of the key as viewed in AWS console"
#   default     = null
# }

# variable "deletion_window_in_days" {
#   type        = number
#   description = "Duration in days after which the key is deleted after destruction of the resource"
#   default     = null
# }

# variable "customer_master_key_spec" {
#   type        = string
#   description = "Choose a valid key type"
#   default     = null
# }

# variable "key_usage" {
#   type        = string
#   description = "Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY."
#   default     = null
# }

# variable "is_enabled" {
#   type        = bool
#   default     = null
#   description = "Specifies whether the key is enabled"
# }

# variable "enable_key_rotation" {
#   type        = bool
#   default     = null
#   description = "Specifies whether key rotation is enabled"
# }
 
# variable "multi_region" {
#   type        = bool
#   default     = null
#   description = "Indicates whether the KMS key is a multi-Region (true) or regional (false) key"
# }

# variable "alias_name" {
#   description = "The name of the key alias"
#   type        = string
#   default     = null
# }

# variable "Secret_data" {
#   description = "Data to be encrypted. Note that this may show up in logs, and it will be stored in the state file."
#   type        = string
#   default = ""
# }

# variable "kms_enabled" {
#   type        = bool
#   description = "Specifies whether to create resources within this module."
# }

# variable "enable_kms_ciphertext" {
#   type        = bool
#   description = "Specifies whether to create resources within this module."
# }

# ## IAM ROLE GLUE
# variable "glue_iam_tags" {
#   type = map(string)
#   description = "(optional) describe your variable"
#   default     = {}
# }

# variable "glue_aws_managed_policy" {
#     type = list
#     description = "managed policy"
#     default = []
# }
# variable "glue_iam_description" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "glue_policy_name" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "glue_role_name" {
#   type = string
#   description = "(optional) describe your variable"
# }


# ##-------GLUE------------
# variable "glue_tags" {
#   type = map(string)
#   description = "(optional) describe your variable"
#   default     = {}
# }

# variable "dev_endpoint" {
#   type = map(any)
#   description = "Dev Endpoint"
# }

# variable "glue_dev_endpoint_tags" {
#   type = map(string)
#   description = "(optional) describe your variable"
#   default     = {}
# }

# variable "catlogue_db_name" {
#   type = string
#   description = "(optional) describe your variable"
# }

# variable "glue_crawler_name" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "create_glue_job" {
#   type = bool
#   description = "(optional) describe your variable"
# }


# ##Athena
# variable "create_athena_db" {
#   type = bool
#   description = "(optional) describe your variable"
# }
# variable "create_athena_workgroup" {
#   type = bool
#   description = "(optional) describe your variable"
# }
# variable "athena_workgroup_name" {
#   type = string
#   description = "(optional) describe your variable"
#   default = ""
# }
# variable "enforce_workgroup_configuration" {
#   type = bool
#   description = "(optional) describe your variable"
# }
# variable "publish_cloudwatch_metrics_enabled" {
#   type = bool
#   description = "(optional) describe your variable"
# }

# variable "encryption_type" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "create_athena_datacatalog" {
#   type = bool
#   description = "(optional) describe your variable"
# }

# variable "athena_catalog_name" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "catalog_description" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "catalog_type" {
#   type = string
#   description = "It can be Glue, Lambada, hive"
# }
# variable "catalog_parameters" {
#   type = map(any)
#   description = "It holds different key values as per catalog type"
# }
# variable "enable_athena_named_query" {
#   type = bool
#   description = "(optional) describe your variable"
# }

####SageMaker
variable "repository_url" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}
variable "sm_repository_name" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}
variable "sn_instance_type" {
  type = string
  description = "(optional) describe your variable"
}
variable "notebook_instance_name" {
  type = string
  description = "(optional) describe your variable"
}
variable "sm_role_name" {
  type = string
  description = "(optional) describe your variable"
}
variable "sagemaker_aws_managed_policy" {
  type = list
  description = "(optional) describe your variable"
}
variable "sm_tags" {
  type = map(string)
  description = "(optional) describe your variable"
  default = {}
}
variable "create_sg_code_repo" {
  type = bool
  description = "(optional) describe your variable"
}


# ### SFTP
# variable "enable_sftp" {
#   type = bool
#   description = "(optional) describe your variable"
# }
# variable "ssh_public_key" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "identity_provider_type" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "endpoint_type" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "sftp_user_name" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "sftp_role_name" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "sftp_policy_name" {
#   type = string
#   description = "(optional) describe your variable"
# }
# variable "sftp_iam_description" {
#   type = string
#   description = "(optional) describe your variable"
# }