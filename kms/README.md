# terraform-aws-kms
Terraform module for AWS KMS


## Compatibility
 ```
 -- Required version for terraform is "=1.1.0"
 -- Required version for aws is "~> 3.70.0"
 ```


 ## usage
```
   module "kms_key" {
    source      = "./modules"
    
    name                    = "kms"
    environment             = "dev"
    is_enabled              = true
    description             = "KMS key for cloudtrail"
    deletion_window_in_days = 7
    enable_key_rotation     = true
    alias                   = "alias/cloudtrail"
    policy                  = data.aws_iam_policy_document.default.json
    multi_region            = false
    key_usage               = false
  }
  ```
