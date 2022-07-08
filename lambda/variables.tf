
variable "filename" {
    description = "The path to the function's deployment package within the local filesystem. If defined. No S3 support"
    type        = string
    default = ""
}
  
variable "description" {
  description = "Description of what your Lambda Function does."
  type        = string
}

variable "function_name" {
  description = "A unique name for your Lambda Function."
  type        = string
}

variable "role_arn" {
  description = "IAM role attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to."
  type        = string
  default = ""
}

variable "handler" {
  description = "The function entrypoint in your code."
  type        = string
  default = ""
}

variable "runtime" {
  description = "See Runtimes for valid values."
  type        = string
  default     = "python3.7"
}

variable "publish" {
  description = "Whether to publish creation/change as new Lambda Function Version. Defaults to true."
  type        = bool
  default     = true
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128."
  type        = number
  default     = 128
}

variable "lambda_timeout" {
  description = "The amount of time your Lambda Function has to run in seconds. Defaults to 5"
  type        = number
  default     = 5
}

variable "concurrency" {
  description = "The amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. "
  type        = number
  default = -1
}

variable "tags" {
  description = "A mapping of tags to assign to the object."
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "The Lambda environment's configuration settings."
  type        = map(string)
  default     = null
}

# variable "vpc_config" {
#   default     = null
#   description = "Provide this to allow your function to access your VPC. Fields documented below. See Lambda in VPC."
#   type = object({
#     security_group_ids = list(string)
#     subnet_ids         = list(string)
#   })
# }

variable "file_system_config" {
  default     = null
  description = "Provide this to allow your function to mount your EFS file system. Fields documented below. See Lambda with EFS."
  type = object({
    efs_access_point_arn = string
    local_mount_path     = string
  })
}

variable "tracing_config" {
  default     = null
  description = "Use AWS X-Ray to collect data about events that your function processes, and to identify the cause of errors in your serverless applications. Can be either PassThrough or Active."
  type = object({
    mode = string
  })
}

variable "log_retention" {
  default     = 1
  description = "Specifies the number of days you want to retain log events in the specified log group."
  type        = number
}

variable "source_code_hash" {
  description = "Used to trigger updates when file contents change.  Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key."
  type        = string
 }

variable "event_rule_name" {
  description = "name of the cloud watch event rule"
  type        = string
  default     = ""
}

variable "event_description" {
  description = "Description of the cloud watch event rule"
  type        = string
  default     = ""
}

variable "event_schedule_expression" {
  description = "schedule_expression"
  type        = string
  default     = ""
}

variable "create_eventbridge_trigger" {
  type = bool
  description = "option to create layer for lambda function"
}

variable "event_target_id" {
  type        = string
  description = "The Amazon Resource Name (ARN) associated with the role that is used for target invocation."
  default     = ""
}

variable "event_statement_id" {
  type        = string
  description = "Enter the statement_id."
  default     = ""
}

variable "event_action" {
  type        = string
  description = "Enter the action."
  default     = ""
}

variable "event_principal" {
  type        = string
  description = "Enter the principal."
  default     = ""
}

variable "create_lambda_layer" {
  type = bool
  description = "option to create layer for lambda function"
}

variable "layer_filename" {
  description = "The path to the layer's deployment package within the local filesystem"
  type        = string
  default     = ""
}

variable "layer_name" {
  description = "Enter a name for the layer"
  type        = string
  default     = ""
}

variable "layer_source_code_hash" {
  description = "Used to trigger updates when file contents change.  Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key."
  type        = string
  default     = ""
 }

 variable "compatible_runtimes" {
  description = "A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified."
  type        = list(string)
  default     = []
}

variable "layer_description" {
  description = "Description of your Lambda Function (or Layer)"
  type        = string
  default     = ""
}