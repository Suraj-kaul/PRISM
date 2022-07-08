variable "athena_workgroup_name" {
    type = string
    description = "Name of the workgroup"
  
}
variable "database_name" {
    type = string
    description = "Name of the database"
    default = ""
}

variable "description_data_catalog" {
    type = string
    description = "describe the catalog"
    default = "Catalog description"
  
}
variable "data_catalog_name" {
    type = string
    
}
variable "type" {
    type = string
    description = "type of catalog LAMBDAM, GLUE, HIVE"
  
}
variable "catalog_parameters" {
    type = map(any)
    description = "It holds different map values as per the catalog type"
  

}
variable "query_name" {
    type = string
    default= ""
    description = "name of the query"
  
}
variable "enforce_workgroup_configuration" {
    type = bool
    description = "enforce_workgroup_enabled"
  
}

variable "publish_cloudwatch_metrics_enabled" {
    type = bool
    description = "clodwatch_metrics_enabled"
  
}


variable "encryption_option" {
    type = string
    description = "encryption key"
    default = "SSE_S3"
  
}
variable "destination_bucket" {
    type = string
    description = "name of the bucket"
    default = ""
}
variable "aws_athena_database" {
    type = bool
  
}
variable "aws_athena_data_catalog" {
    type = bool
  
}
 variable "aws_athena_named_query" {
    type = bool
   
}

variable "aws_athena_workgroup" {
    type = bool
  
}

variable "athena_bucket" {
    type = string
    description = "(optional) describe your variable"
    default = ""
}

variable "tags" {
    type = map(string)
    description = "(optional) describe your variable"
    default = {}
}