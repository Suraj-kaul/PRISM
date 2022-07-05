##kms policy

data "aws_iam_policy_document" "kms_policy" {
  version = "2012-10-17"

  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:root"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }

  # statement {
  #   sid    = "Allow use of the key"
  #   effect = "Allow"
  #   principals {
  #     type        = "AWS"
  #     identifiers = ["arn:aws:iam::${var.account_id}:user/cloud_user"]
  #   }
  #   actions    = ["kms:Decrypt","kms:DescribeKey"]
  #   resources = ["*"]
  # }

  #   statement {
  #   sid    = "Allow access for Key Administrators"
  #   effect = "Allow"
  #   principals {
  #     type        = "AWS"
  #     identifiers = ["arn:aws:iam::${var.account_id}:user/cloud_user"]
  #   }
  #   actions    = ["kms:Create*","kms:Describe*","kms:Enable*","kms:List*","kms:Put*","kms:Update*","kms:Revoke*","kms:Disable*","kms:Get*","kms:Delete*","kms:TagResource","kms:UntagResource","kms:ScheduleKeyDeletion","kms:CancelKeyDeletion"]
  #   resources = ["*"]
  # }

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:root"] #["${module.s3_bucket["source"].s3_arn}"] 
    }
    actions   = [ "kms:CreateGrant", "kms:ListGrants", "kms:RevokeGrant" ]
    resources = ["*"]
  
    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
      }
  }
}


#This is kms module.
module "kms_key" {
  source = "./kms"
  kms_enabled              = var.kms_enabled
  is_enabled               = var.is_enabled
  enable_key_rotation      = var.enable_key_rotation
  multi_region             = var.multi_region
  kms_description          = var.kms_description
  deletion_window_in_days  = var.deletion_window_in_days
  kms_policy               = data.aws_iam_policy_document.kms_policy.json
  customer_master_key_spec = var.customer_master_key_spec
  key_usage                = var.key_usage
  alias_name               = var.alias_name
  enable_kms_ciphertext    = var.enable_kms_ciphertext
  Secret_data              = var.Secret_data
  tags                     = merge(var.common_tags, var.kms_tags) 
}

# data "aws_kms_key" "key_arn" {
#   key_id = module.kms_key.key_id
# }


module "s3_bucket"{
    source = "./s3"
    for_each = var.bucket_name
    bucket_name = each.value.bucket
    versioning_enable = each.value.versioning
    sse_algorithm = each.value.sse_algorithm
    kms_arn =each.value.sse_algorithm == "aws:kms" ? module.kms_key.key_arn : null
    bucket_acl = each.value.acl
    tags= each.value.tags

    attach_policy = false 
}

data "aws_iam_policy_document" "assume_role_policy"{
      statement {

    effect = "Allow"
    sid    = "1"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "cutomer_policy" {
  version = "2012-10-17"
  statement {

    actions = [
      "s3:GetBucketLocation",
      "s3:ListAllMyBuckets",
      "s3:ListBucket",
      "s3:GetBucketAcl",
      "s3:GetObject"
    ]
    effect    = "Allow"
    resources = [ "arn:aws:s3:::${module.s3_bucket["raw_data"].s3_bucket_id}","arn:aws:s3:::${module.s3_bucket["raw_data"].s3_bucket_id}/*"]
  }
}
module "iam_role_policy" {
  source  = "./iam"
  
  role_name          = "glue-role"  #var.role_name
  assume_role_policy =  data.aws_iam_policy_document.assume_role_policy.json  #var.assume_role_policy
  policy_name     = "GLUE-POLICY" #var.policy_name
  iam_description = "Permission required by glue" #var.iam_description
  policy          = data.aws_iam_policy_document.cutomer_policy.json #var.policy
  tags = {
    "owner" = "aakash.vishwakarma"
  }#var.tags
  aws_managed_policy = var.aws_managed_policy         
  
}
module "glue" {
  source = "./Glue"
  catlogue_db_name = "prism-demo-db"
  crawler_name ="prism-demo-crawler"
  role =module.iam_role_policy.role_arn
  source_bucket =module.s3_bucket["raw_data"].s3_bucket_id
}

module "athena" {
  source = "./Athena"
  aws_athena_database = false
  # database_name = "athena_demo"
  aws_athena_workgroup = true
  athena_workgroup_name ="Prism-Demo-POC"
  enforce_workgroup_configuration = true
  publish_cloudwatch_metrics_enabled =true 
  athena_bucket = module.s3_bucket["pre_stage"].s3_bucket_id
  destination_bucket=module.s3_bucket["stage"].s3_bucket_id
  encryption_option= "SSE_S3"
  aws_athena_data_catalog = true
  data_catalog_name ="Prism-demo-POC"
  description_data_catalog ="Prism demo catalog"
  type = "GLUE"
  catalog_parameters ={
    "catalog-id" ="676634049556"   # in Glue catalogue it holds Account-ID
  }
  aws_athena_named_query = false
  query_name ="Demo-query"
}

module "sftp" {
    source = "./SFTP"
    enable_sftp   = true
    public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCoE95+TuZ7mavx0hP2Z0qs/6WybMoic0SH5h6tcH8AmsAfQBlgtRhkCmfrJflVJhwTgMkb5hfauSJ9OsherhKetIra7exKsDzXw+7MThaH1Xmzf16UeOhXeDvEMkDCU89l1ql8HyVdeNu4EhygnN0Bk/TB5AHw5fKhpVTQXpe+DdX1n10YDTL1ueKaSm/jom9eMuTOR4CcrU+M35Lru5gyhnML+6Swdql/D2YVhjlA5VbwnWA3Zbo3nnDIAS46JbJCPekIT2236bd+EE4QihXKi3Ddn4l6KssyK9qyB/e506OfqpssQgQN0d4/aT5OU+M9KEuSk13lBcOHSkejKNCDz6cFZwegM3OiPuCc2gPkIzCvre3IY6WP3Pe19LcnIWOcFhrVyLEgaZrmd5jtA2y3oV0AJ6fXvarvs+MnGQwI/Yfy4ws+oNpdhiRA0lDfRLIUh7wBW3SszRZF9EE5Ob010hoMj9uAwQA8aepf811QeKGVdsSmsitvPYPHs9fk+rW73WWg4gu783LecB15ZnR85apI9mLlpm+YA7OehpDOik4+hzaJLRN50vrZ+5oMyDbkeHlLbwandKg54k6a5DCuixCgy4TsVsfCpzqwN4GU8fZXmPTGX4TW/SFRXVrrgCmbQt/HVIbc7YM3ZsobOWiH9nhCYC04/ALxwDkFds7LRQ== "
    identity_provider_type = "SERVICE_MANAGED"
    endpoint_type = "PUBLIC"
    user_name     = "aaksh"
    s3_bucket_id = module.s3_bucket["sftp_bucket"].s3_bucket_id
    common_tags = {
        "Name" = "Aakash"
    }

}
# resource "aws_athena_workgroup" "example-workgroup" {
#   name          = "query_workgroup"
#   force_destroy = true

#   configuration {
#     enforce_workgroup_configuration    = true
#     publish_cloudwatch_metrics_enabled = true

#     result_configuration {
#       output_location = "s3://${aws_s3_bucket.athena-results.bucket}/query-results/"
#     }
#   }
# }


# resource "aws_glue_catalog_database" "mydb" {
#   name = "examplegluedb"
# }

# resource "aws_glue_crawler" "test_crawler" {
#   database_name = aws_glue_catalog_database.mydb.name
#   name          = "test_crawler"
#   role          = module.iam_role_policy.role_arn

#   s3_target {
#     # path = "s3://${module.s3_bucket["aakash-source-bucket29062022"].s3_bucket_id}/${var.datalake_data_prefix}/"
#     path = "s3://${module.s3_bucket["aakash-source-bucket29062022"].s3_bucket_id}"
#   }
# }