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

kms_tags = {
    Name = "kms_key"
    Description = "general purpose kms key"
  }

######################## ENTER KMS VALUES ###############################
kms_enabled              = true
enable_kms_ciphertext    = true
is_enabled               = true
enable_key_rotation      = false
multi_region             = false
kms_description          = "General purpose KMS key"
deletion_window_in_days  = 10
customer_master_key_spec = "SYMMETRIC_DEFAULT"
key_usage                = "ENCRYPT_DECRYPT"
alias_name               = "GP-kms-key"