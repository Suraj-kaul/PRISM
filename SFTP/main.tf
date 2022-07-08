data "aws_iam_policy_document" "transfer_server_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["transfer.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "transfer_server_assume_policy" {
  statement {
    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = ["*"]
  }
}

# Module      : AWS TRANSFER SERVER
# Description : Provides a AWS Transfer Server resource.
resource "aws_transfer_server" "transfer_server" {
  count = var.enable_sftp && var.endpoint_type == "PUBLIC" ? 1 : 0

  identity_provider_type = var.identity_provider_type
  logging_role           = module.IAM.role_arn
  force_destroy          = false
  tags                   =var.tags
  endpoint_type          = var.endpoint_type
}
#with VPC endpoint
resource "aws_transfer_server" "transfer_server_vpc" {
  count = var.enable_sftp && var.endpoint_type == "VPC" ? 1 : 0

  identity_provider_type = var.identity_provider_type
  logging_role           = module.IAM.role_arn
  force_destroy          = false
  tags                   =var.tags
  endpoint_type          = var.endpoint_type
  endpoint_details {
    vpc_id = var.vpc_id
  }
}

resource "aws_transfer_user" "transfer_server_user" {
  count = var.enable_sftp ? 1 : 0

  server_id      = var.endpoint_type == "VPC" ? join("", aws_transfer_server.transfer_server_vpc.*.id) : join("", aws_transfer_server.transfer_server.*.id)
  user_name      = var.user_name
  role           = module.IAM.role_arn
  home_directory = format("/%s/%s", var.s3_bucket_id, var.sub_folder)
  tags           =var.tags

}

resource "aws_transfer_ssh_key" "transfer_server_ssh_key" {
  count = var.enable_sftp ? 1 : 0

  server_id = join("", aws_transfer_server.transfer_server.*.id)
  user_name = join("", aws_transfer_user.transfer_server_user.*.user_name)
  body      = var.public_key == "" ? "" : var.public_key
}

module "IAM" {
  source = "../iam"
  role_name          = var.sftp_role_name
  assume_role_policy =  data.aws_iam_policy_document.transfer_server_assume_role.json  #var.assume_role_policy
  create_iam_policy = true
  policy_name     =  var.sftp_policy_name
  iam_description =  var.sftp_iam_description
  policy          = data.aws_iam_policy_document.transfer_server_assume_policy.json #var.policy
  tags =  var.tags
  aws_managed_policy = var.aws_managed_policy   
  
}