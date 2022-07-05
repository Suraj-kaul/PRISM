bucket_name={
    "sftp_bucket"={
        bucket="aakash-sftp-bucket856852"
        acl= "private"
        versioning= true
        sse_algorithm="aws:kms"

        tags = {
            "Owner" = "aakash.vishwakarma@cloudeq.com"
            "Application" = "cloudeq-poc"
        }
    }
     "raw_data"={
        bucket="aakash-raw-bucket23235998"
        acl= "private"
        versioning= false
        sse_algorithm="aws:kms"
      
        tags = {
            "Owner" = "aakash.vishwakarma@cloudeq.com"
            "Application" = "cloudeq-poc"
        }
    }
     "pre_stage"={
        bucket="aakash-pre-satge-bucket29062022"
        acl= "private"
        versioning= false
        sse_algorithm="aws:kms"
      
        tags = {
            "Owner" = "aakash.vishwakarma@cloudeq.com"
            "Application" = "cloudeq-poc"
        }
    }
    "stage"={
        bucket="aakash-stage-bucket89546"
        acl= "private"
        versioning= false
        sse_algorithm="aws:kms"
      
        tags = {
            "Owner" = "aakash.vishwakarma@cloudeq.com"
            "Application" = "cloudeq-poc"
        }
    }
    "image"={
        bucket="aakash-image-storage-bucket29062022"
        acl= "private"
        versioning= false
        sse_algorithm="AES256"
      
        tags = {
            "Owner" = "aakash.vishwakarma@cloudeq.com"
            "Application" = "cloudeq-poc"
        }
    }
}
aws_managed_policy =["service-role/AWSGlueServiceRole"]
# datalake_data_prefix = "Datalakeprefix"

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