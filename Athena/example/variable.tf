# variable "name" {
#     type = string
#     description = "Name of the workgroup"
  
# }

# variable "enforce_workgroup_configuration" {
#     type = bool
#     description = ""
  
# }

# variable "publish_cloudwatch_metrics_enabled" {
#     type = bool
#     description = ""
  
# }

# variable "encryption_option" {
#     type = string
#     description = ""

  
# }
variable "bucket" {
    type = string
    description = ""
  
}
variable "group" {
    type = map(any)
  
}