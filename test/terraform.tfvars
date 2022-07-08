common_tags = {
  "Owner" = "Aakash Vishwakarma"
  "Environment" = "POC"
  "Application" = "MCD"
}

## S3 bucket
bucket_name={
    "sftp_bucket"={
        bucket="aakash-sftp-bucket856852"
        acl= "private"
        versioning= true
        sse_algorithm="aws:kms"

        tags = {
            "Email" = "aakash.vishwakarma@cloudeq.com"
            "Purpose" = "cloudeq-poc"
        }
    }
     "raw_data"={
        bucket="aakash-raw-bucket23235998"
        acl= "private"
        versioning= false
        sse_algorithm="aws:kms"
      
        tags = {
            "Email" = "aakash.vishwakarma@cloudeq.com"
            "Purpose" = "cloudeq-poc"
        }
    }
     "pre_stage"={
        bucket="aakash-pre-satge-bucket29062022"
        acl= "private"
        versioning= false
        sse_algorithm="aws:kms"
      
        tags = {
            "Email" = "aakash.vishwakarma@cloudeq.com"
            "Purpose" = "cloudeq-poc"
        }
    }
    "stage"={
        bucket="aakash-stage-bucket89546"
        acl= "private"
        versioning= false
        sse_algorithm="aws:kms"
      
        tags = {
            "Email" = "aakash.vishwakarma@cloudeq.com"
            "Purpose" = "cloudeq-poc"
        }
    }
    "image"={
        bucket="aakash-image-storage-bucket29062022"
        acl= "private"
        versioning= false
        sse_algorithm="AES256"
      
        tags = {
            "Email" = "aakash.vishwakarma@cloudeq.com"
            "Purpose" = "cloudeq-poc"
        }
    }
}

##GLue Dataendpoints
dev_endpoint ={
    "Demo-Poc1"={

    }
    "Demo-POC2"={

    }
}
glue_dev_endpoint_tags = {}
# Glue role
glue_aws_managed_policy =["service-role/AWSGlueServiceRole"]
glue_iam_description = "Permission required by GLUE"
glue_policy_name = "GLUE-POLICY"
glue_role_name = "Glue-role"
glue_iam_tags = {}

##Glue
catlogue_db_name = "prism-demo-db"
glue_crawler_name = "prism-demo-crawler"
create_glue_job = false
glue_tags = {}

## Athena
athena_tags = {}
create_athena_db = false
create_athena_workgroup = true
athena_workgroup_name = "Prism-Demo-POC-workgroup"
enforce_workgroup_configuration = true
publish_cloudwatch_metrics_enabled = true
encryption_type = "SSE_S3"
create_athena_datacatalog = true
athena_catalog_name = "Prism-demo-POC_catalog"
catalog_description = "Prism demo catalog"
catalog_type = "glue"
catalog_parameters ={
    "catalog-id" = "711392004085"  # This Id is use in case of Glue and it has to be AWS account ID
}
enable_athena_named_query = false

##KMS
account_id= "676634049556"
kms_enabled = true
is_enabled=true
enable_key_rotation = false
multi_region = false
kms_description = "KMS key for Prism demo"
deletion_window_in_days = 7
alias_name = "Prism_key_POc"
enable_kms_ciphertext = false
kms_tags = {}

### SageMaker
sm_tags = {}
create_sg_code_repo = false
# repository_url = "https://github.com/aakash-ceq/Gihub-workflow-demo"
# sm_repository_name = "Prism-Demo-repo"
sn_instance_type = "ml.t2.medium"
notebook_instance_name = "Prism-Demo-notebook"
sm_role_name = "sagemaker-role"
sagemaker_aws_managed_policy = ["AmazonSageMakerFullAccess"]


#### SFTP
sftp_tags = {}
enable_sftp = true
ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCoE95+TuZ7mavx0hP2Z0qs/6WybMoic0SH5h6tcH8AmsAfQBlgtRhkCmfrJflVJhwTgMkb5hfauSJ9OsherhKetIra7exKsDzXw+7MThaH1Xmzf16UeOhXeDvEMkDCU89l1ql8HyVdeNu4EhygnN0Bk/TB5AHw5fKhpVTQXpe+DdX1n10YDTL1ueKaSm/jom9eMuTOR4CcrU+M35Lru5gyhnML+6Swdql/D2YVhjlA5VbwnWA3Zbo3nnDIAS46JbJCPekIT2236bd+EE4QihXKi3Ddn4l6KssyK9qyB/e506OfqpssQgQN0d4/aT5OU+M9KEuSk13lBcOHSkejKNCDz6cFZwegM3OiPuCc2gPkIzCvre3IY6WP3Pe19LcnIWOcFhrVyLEgaZrmd5jtA2y3oV0AJ6fXvarvs+MnGQwI/Yfy4ws+oNpdhiRA0lDfRLIUh7wBW3SszRZF9EE5Ob010hoMj9uAwQA8aepf811QeKGVdsSmsitvPYPHs9fk+rW73WWg4gu783LecB15ZnR85apI9mLlpm+YA7OehpDOik4+hzaJLRN50vrZ+5oMyDbkeHlLbwandKg54k6a5DCuixCgy4TsVsfCpzqwN4GU8fZXmPTGX4TW/SFRXVrrgCmbQt/HVIbc7YM3ZsobOWiH9nhCYC04/ALxwDkFds7LRQ== "
identity_provider_type = "SERVICE_MANAGED"
endpoint_type = "PUBLIC"
sftp_user_name = "aaksh"
sftp_role_name = "sftp-role"  
sftp_policy_name = "SFTP-POLICY"
sftp_iam_description =  "Permission required by sftp"