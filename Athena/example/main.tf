#<-------> module with for each

# module "athena" {
#     source = "../"
#     for_each = var.group
#     bucket = each.key
#     name = each.value.name
#     enforce_workgroup_configuration = each.value.enforce_workgroup_configuration 
#     publish_cloudwatch_metrics_enabled = each.value.publish_cloudwatch_metrics_enabled
#     encryption_option = each.value.encryption_option


  
# }

#<---------> module without for each
module "athena" {
    source = "../"
    bucket = var.bucket
    athena_workgroup_name = var.athena_workgroup_name
    enforce_workgroup_configuration = var.enforce_workgroup_configuration 
    publish_cloudwatch_metrics_enabled = var.publish_cloudwatch_metrics_enabled
    encryption_option = var.encryption_option
    database_name = var.database_name
    data_catalog_name = var.data_catalog_name
    description_data_catalog =var.description_data_catalog
    type = var.type
    catalog_parameters = var.catalog_parameters
    query_name = var.query_name
    #--- line 30 to 35 are the optional based resources
    aws_s3_bucket = var.aws_s3_bucket
    demo_bucket = var.demo_bucket
    aws_athena_database = var.aws_athena_database
    aws_athena_data_catalog = var.aws_athena_data_catalog
    aws_athena_named_query = var.aws_athena_named_query
    aws_athena_workgroup = var.aws_athena_workgroup




  
}