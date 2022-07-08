data "aws_iam_policy_document" "sm_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    
    principals {
      type = "Service"
      identifiers = ["sagemaker.amazonaws.com"]
    }
  }
}

resource "aws_sagemaker_code_repository" "example" {
  count = var.create_sg_code_repo ? 1 : 0
  code_repository_name = var.repository_name

  git_config {
    repository_url = var.repository_url
  }
  tags =var.tags
}

resource "aws_sagemaker_notebook_instance" "this" {
  name                    = var.notebook_instance_name 
  role_arn                = module.iam_role_policy.role_arn
  instance_type           = var.instance_type
  default_code_repository = var.create_sg_code_repo == false ? "" :  aws_sagemaker_code_repository.example[0].code_repository_name

  tags = var.tags
}
module "iam_role_policy" {
  source  = "../iam"
  
  role_name          = var.sm_role_name
  assume_role_policy =  data.aws_iam_policy_document.sm_assume_role_policy.json
  create_iam_policy = false
  tags = var.tags
  aws_managed_policy = var.aws_managed_policy     #AmazonSageMakerFullAccess     
}