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
    resources = [ "arn:aws:s3:::${var.raw_bucket}","arn:aws:s3:::${var.raw_bucket}/*"]
  }
}
module "iam_role_policy" {
  source  = "../../iam"
  
  role_name          = "glue-role" #var.glue_role_name
  assume_role_policy =  data.aws_iam_policy_document.assume_role_policy.json  #var.assume_role_policy
  policy_name     = "GLUE-POLICY" #var.glue_policy_name
  iam_description = "Permission required by GLUE"#var.glue_iam_description
  policy          = data.aws_iam_policy_document.cutomer_policy.json #var.policy
  tags = {
    "owner" = "aakash.vishwakarma"
  }#var.tags
  aws_managed_policy = ["service-role/AWSGlueServiceRole"] #var.aws_managed_policy         
  
}

module "glue" {
  source = "../"
  catlogue_db_name = "prism-demo-db"
  crawler_name ="prism-demo-crawler"
  source_bucket ="demo12145"
  create_glue_job = false
  job_name = "Demo-prism-job"
  bucket = "demo12145"
  glue_role_arn = module.iam_role_policy.role_arn
}

module "glue-dev-endpoint" {
    source = "../Dev-Endpoint"
    glue_dev_endpoint_role_arn = module.iam_role_policy.role_arn
    for_each = var.dev_endpoint
    
    glue_dev_endpoint_name = each.key

  # glue_dev_endpoint_arguments = 
  # glue_dev_endpoint_extra_jars_s3_path = 
  # glue_dev_endpoint_extra_python_libs_s3_path = 
  # glue_dev_endpoint_glue_version = 
  # glue_dev_endpoint_number_of_nodes = 
  # glue_dev_endpoint_number_of_workers = 
  # glue_dev_endpoint_public_key = 
  # glue_dev_endpoint_public_keys = 
  # glue_dev_endpoint_security_configuration = 
  # glue_dev_endpoint_security_group_ids = 
  # glue_dev_endpoint_subnet_id =
  # glue_dev_endpoint_worker_type = 
  
    
}