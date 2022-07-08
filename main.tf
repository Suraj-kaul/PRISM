# ##kms policy

# data "aws_iam_policy_document" "kms_policy" {
#   version = "2012-10-17"

#   statement {
#     sid    = "Enable IAM User Permissions"
#     effect = "Allow"
#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::${var.account_id}:root"]
#     }
#     actions   = ["kms:*"]
#     resources = ["*"]
#   }

#   statement {
#     sid    = "Allow use of the key"
#     effect = "Allow"
#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::${var.account_id}:root"]
#     }
#     actions    = ["kms:Decrypt","kms:DescribeKey"]
#     resources = ["*"]
#   }

#   statement {
#     sid    = "Allow attachment of persistent resources"
#     effect = "Allow"
#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::${var.account_id}:root"] 
#     }
#     actions   = [ "kms:CreateGrant", "kms:ListGrants", "kms:RevokeGrant" ]
#     resources = ["*"]
  
#     condition {
#       test     = "Bool"
#       variable = "kms:GrantIsForAWSResource"
#       values   = ["true"]
#       }
#   }
# }


# #This is kms module.
# module "kms_key" {
#   source = "./kms"
#   kms_enabled              = var.kms_enabled
#   is_enabled               = var.is_enabled
#   enable_key_rotation      = var.enable_key_rotation
#   multi_region             = var.multi_region
#   kms_description          = var.kms_description
#   deletion_window_in_days  = var.deletion_window_in_days
#   kms_policy               = data.aws_iam_policy_document.kms_policy.json
#   customer_master_key_spec = var.customer_master_key_spec
#   key_usage                = var.key_usage
#   alias_name               = var.alias_name
#   enable_kms_ciphertext    = var.enable_kms_ciphertext
#   Secret_data              = var.Secret_data
#   tags                     = merge(var.common_tags, var.kms_tags) 
# }

# ## S3--------
# module "s3_bucket"{
#     source = "./s3"
#     for_each = var.bucket_name
#     bucket_name = each.value.bucket
#     versioning_enable = each.value.versioning
#     sse_algorithm = each.value.sse_algorithm
#     kms_arn =each.value.sse_algorithm == "aws:kms" ? module.kms_key.key_arn : null
#     bucket_acl = each.value.acl
#     tags= merge(var.common_tags, each.value.tags)

#     attach_policy = false 
# }
# ## IAM for GLUE--------------
# data "aws_iam_policy_document" "assume_role_policy"{
#       statement {

#     effect = "Allow"
#     sid    = "1"
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["glue.amazonaws.com"]
#     }
#   }
# }

# data "aws_iam_policy_document" "cutomer_policy" {
#   version = "2012-10-17"
#   statement {

#     actions = [
#       "s3:GetBucketLocation",
#       "s3:ListAllMyBuckets",
#       "s3:ListBucket",
#       "s3:GetBucketAcl",
#       "s3:GetObject"
#     ]
#     effect    = "Allow"
#     resources = [ "arn:aws:s3:::${module.s3_bucket["raw_data"].s3_bucket_id}","arn:aws:s3:::${module.s3_bucket["raw_data"].s3_bucket_id}/*"]
#   }
# }
# module "iam_role_glue" {
#   source  = "./iam"
  
#   role_name          = var.glue_role_name
#   assume_role_policy =  data.aws_iam_policy_document.assume_role_policy.json  #var.assume_role_policy
#   policy_name     = var.glue_policy_name
#   iam_description = var.glue_iam_description
#   policy          = data.aws_iam_policy_document.cutomer_policy.json #var.policy
#   tags =  merge(var.common_tags, var.glue_iam_tags) 
#   aws_managed_policy = var.glue_aws_managed_policy         
  
# }


# module "glue" {
#   source = "./Glue"
#   catlogue_db_name = var.catlogue_db_name
#   crawler_name =var.glue_crawler_name
#   source_bucket =module.s3_bucket["raw_data"].s3_bucket_id
#   create_glue_job = var.create_glue_job
#   bucket = module.s3_bucket["raw_data"].s3_bucket_id
#   glue_role_arn = module.iam_role_glue.role_arn
#   tags = merge(var.common_tags, var.glue_tags) 
# }

# module "glue-dev-endpoint" {
#     source = "./Glue/Dev-Endpoint"
#     glue_dev_endpoint_role_arn = module.iam_role_glue.role_arn
#     for_each = var.dev_endpoint
    
#     glue_dev_endpoint_name = each.key
#     tags = merge(var.common_tags, var.glue_dev_endpoint_tags) 
# }
# #   ## GLUE DEV ENDPOINT____
#   # glue_dev_endpoint_arguments = 
#   # glue_dev_endpoint_extra_jars_s3_path = 
#   # glue_dev_endpoint_extra_python_libs_s3_path = 
#   # glue_dev_endpoint_glue_version = 
#   # glue_dev_endpoint_number_of_nodes = 
#   # glue_dev_endpoint_number_of_workers = 
#   # glue_dev_endpoint_public_key = 
#   # glue_dev_endpoint_public_keys = 
#   # glue_dev_endpoint_security_configuration = 
#   # glue_dev_endpoint_security_group_ids = 
#   # glue_dev_endpoint_subnet_id =
#   # glue_dev_endpoint_worker_type = 
# # }

# module "athena" {
#   source = "./Athena"
#   aws_athena_database = var.create_athena_db
#   aws_athena_workgroup = var.create_athena_workgroup
#   athena_workgroup_name =var.athena_workgroup_name
#   enforce_workgroup_configuration = var.enforce_workgroup_configuration
#   publish_cloudwatch_metrics_enabled =var.publish_cloudwatch_metrics_enabled 
#   athena_bucket = module.s3_bucket["pre_stage"].s3_bucket_id
#   destination_bucket=module.s3_bucket["stage"].s3_bucket_id
#   encryption_option= var.encryption_type
#   aws_athena_data_catalog = var.create_athena_datacatalog
#   data_catalog_name =var.athena_catalog_name
#   description_data_catalog =var.catalog_description
#   type = upper(var.catalog_type)
#   catalog_parameters =var.catalog_parameters
#   aws_athena_named_query = var.enable_athena_named_query
#   tags = merge(var.common_tags, var.athena_tags) 
# }

# module "sagemaker" {
#   source = "./sagemaker"
#   create_sg_code_repo = var.create_sg_code_repo
#   # repository_url = var.repository_url
#   # repository_name =var.sm_repository_name
#   instance_type =var.sn_instance_type
#   notebook_instance_name = var.notebook_instance_name

#   sm_role_name = var.sm_role_name
#   aws_managed_policy=var.sagemaker_aws_managed_policy
#   tags = merge(var.common_tags, var.sm_tags) 
# }

# module "sftp" {
#   source = "./SFTP"
#   enable_sftp   = var.enable_sftp
#   public_key    = var.ssh_public_key
#   identity_provider_type = upper(var.identity_provider_type)
#   endpoint_type = upper(var.endpoint_type)
#   user_name     = var.sftp_user_name
#   sftp_role_name  =var.sftp_role_name
#   sftp_policy_name =var.sftp_policy_name
#   sftp_iam_description =var.sftp_iam_description
#   s3_bucket_id = module.s3_bucket["sftp_bucket"].s3_bucket_id
#   tags = merge(var.common_tags, var.sftp_tags) 
# }

locals {
  lambda_source_file  = "demo.py"
  lambda-zip-location= "outputs/demo.zip"                                  
}

data "archive_file" "lambda_zip" {                                                              
    type    = "zip" 
    source_file = local.lambda_source_file
    output_path = local.lambda-zip-location                                                 
}
module "lambda" {
    source = "./lambda"
    filename = data.archive_file.lambda_zip.output_path
    function_name    = "Prism-lambda-function"
    description      = "Demo lambda function for Prism POC"
    handler          = "demo.lambda_handler"
    source_code_hash = filebase64sha256("${data.archive_file.lambda_zip.output_path}")

    create_lambda_layer        = false
    create_eventbridge_trigger = false
    # event_rule_name            = var.event_rule_name
    # event_description          = var.event_description
    # event_schedule_expression  = var.event_schedule_expression
    # event_statement_id         = var.event_statement_id
    # event_action               = var.event_action
    # event_principal            = var.event_principal

    tags = merge({"Owner"="aakash"},
        { Function = format("%s", "Prism-lambda-function") }
  )
}