variable "catlogue_db_name" {
  type= string
}

variable "crawler_name" {
    type = string
}
variable "source_bucket" {
    type = string
}
# variable "role" {
#     type = string
# }
variable "bucket" {
    type = string
    description = "name of bucket which holds the scipts in python"
}
variable "create_glue_job" {
    type = bool
    description = "(optional) describe your variable"
}
variable "job_name" {
    type = string
    default = ""
    description = "(optional) describe your variable"
}
variable "glue_role_arn" {
    type = string
    description = "(optional) describe your variable"
}

variable "tags" {
  type = map(string)
  description = "(optional) describe your variable"
}

