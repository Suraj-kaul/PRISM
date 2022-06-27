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

  statement {
    sid    = "Allow use of the key"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:user/lambda"]
    }
    actions    = ["kms:Decrypt","kms:DescribeKey"]
    resources = ["*"]
  }

    statement {
    sid    = "Allow access for Key Administrators"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:user/lambda"]
    }
    actions    = ["kms:Create*","kms:Describe*","kms:Enable*","kms:List*","kms:Put*","kms:Update*","kms:Revoke*","kms:Disable*","kms:Get*","kms:Delete*","kms:TagResource","kms:UntagResource","kms:ScheduleKeyDeletion","kms:CancelKeyDeletion"]
    resources = ["*"]
  }

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_id}:user/lambda"]
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
  source = "../"
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
