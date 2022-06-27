########################## ENTER AWS Account Details ##########################

region     = "us-east-1"
profile    = "default"
account_id = "731084091611"

########################## ENTER TAG VALUES #################################

common_tags = {
    Terraform   = "true"
    Environment = "dev"
    Team        = "Devops"
    Platform    = "AWS"
}

s3_tags = {
    Name        = "cp-s3-bucket"
    Owner       = "Chinmay"
    Description = "general purpose s3"
  }

######################## ENTER S3 VALUES ###############################

  bucket_name       ="my-bucket-s3-5445545544444484"
  bucket_acl        = "null"  //"private"
  attach_policy     = true
