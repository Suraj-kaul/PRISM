module "athena" {
    source = "../"
    for_each = var.group
    bucket = var.bucket
    name = each.key
    enforce_workgroup_configuration = each.value.enforce_workgroup_configuration 
    publish_cloudwatch_metrics_enabled = each.value.publish_cloudwatch_metrics_enabled
    encryption_option = each.value.encryption_option


  
}