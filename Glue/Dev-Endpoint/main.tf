##---------------------GLUE DEV ENDPOINT------------------------------
resource "aws_glue_dev_endpoint" "glue_dev_endpoint" {
  # count = var.enable_glue_dev_endpoint ? 1 : 0
  name     = var.glue_dev_endpoint_name
  role_arn = var.glue_dev_endpoint_role_arn

  arguments                 = var.glue_dev_endpoint_arguments
  extra_jars_s3_path        = var.glue_dev_endpoint_extra_jars_s3_path
  extra_python_libs_s3_path = var.glue_dev_endpoint_extra_python_libs_s3_path
  glue_version              = var.glue_dev_endpoint_glue_version
  number_of_nodes           = var.glue_dev_endpoint_number_of_nodes
  number_of_workers         = var.glue_dev_endpoint_number_of_workers
  public_key                = var.glue_dev_endpoint_public_key
  public_keys               = var.glue_dev_endpoint_public_keys
  security_configuration    = var.glue_dev_endpoint_security_configuration
  security_group_ids        = var.glue_dev_endpoint_security_group_ids
  subnet_id                 = var.glue_dev_endpoint_subnet_id

  worker_type = var.glue_dev_endpoint_worker_type

  tags =var.tags
}



####______Variables______
#---------------------------------------------------
#---------------------------------------------------
variable "enable_glue_dev_endpoint" {
  description = "Enable glue dev endpoint usage"
  default     = false
}

variable "glue_dev_endpoint_name" {
  description = "The name of this endpoint. It must be unique in your account."
  default     = ""
}

variable "glue_dev_endpoint_role_arn" {
  description = "(Required) The IAM role for this endpoint."
  default     = null
}

variable "glue_dev_endpoint_arguments" {
  description = "(Optional) A map of arguments used to configure the endpoint."
  default     = null
}

variable "glue_dev_endpoint_extra_jars_s3_path" {
  description = "(Optional) Path to one or more Java Jars in an S3 bucket that should be loaded in this endpoint."
  default     = null
}

variable "glue_dev_endpoint_extra_python_libs_s3_path" {
  description = "(Optional) Path(s) to one or more Python libraries in an S3 bucket that should be loaded in this endpoint. Multiple values must be complete paths separated by a comma."
  default     = null
}

variable "glue_dev_endpoint_glue_version" {
  description = "(Optional) - Specifies the versions of Python and Apache Spark to use. Defaults to AWS Glue version 0.9."
  default     = null
}

variable "glue_dev_endpoint_number_of_nodes" {
  description = "(Optional) The number of AWS Glue Data Processing Units (DPUs) to allocate to this endpoint. Conflicts with worker_type"
  default     = null
}

variable "glue_dev_endpoint_number_of_workers" {
  description = "(Optional) The number of workers of a defined worker type that are allocated to this endpoint. This field is available only when you choose worker type G.1X or G.2X."
  default     = null
}

variable "glue_dev_endpoint_public_key" {
  description = "(Optional) The public key to be used by this endpoint for authentication."
  default     = null
}

variable "glue_dev_endpoint_public_keys" {
  description = "(Optional) A list of public keys to be used by this endpoint for authentication."
  default     = null
}

variable "glue_dev_endpoint_security_configuration" {
  description = "(Optional) The name of the Security Configuration structure to be used with this endpoint."
  default     = null
}

variable "glue_dev_endpoint_security_group_ids" {
  description = "(Optional) Security group IDs for the security groups to be used by this endpoint."
  default     = null
}

variable "glue_dev_endpoint_subnet_id" {
  description = "(Optional) The subnet ID for the new endpoint to use."
  default     = null
}

variable "glue_dev_endpoint_worker_type" {
  description = "(Optional) The type of predefined worker that is allocated to this endpoint. Accepts a value of Standard, G.1X, or G.2X."
  default     = null
}

variable "tags" {
  type = map(string)
  description = "(optional) describe your variable"
}