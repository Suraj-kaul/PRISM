variable "aws_managed_policy" {
    type = list
    description = "(optional) describe your variable"
    default = []
}
variable "repository_url" {
    type = string
    description = "(optional) describe your variable"
    default = ""
}
variable "repository_name" {
    type = string
    description = "Name of Sagemaker repo"
    default = ""
}
variable "instance_type" {
    type = string
    description = "type of instance to be used in Sagemaker"
}
variable "notebook_instance_name" {
    type = string
    description = "Name of notebook instance"
}
variable "sm_role_name" {
    type = string
    description = "sagemaker role name"
}
variable "tags" {
    type = map(string)
    description = "(optional) describe your variable"
}
variable "create_sg_code_repo" {
    type = bool
    description = "(optional) describe your variable"
    default = false
}