# terraform-S3

 -- Here we are creating modules to provision a S3.

## Compatibility
 ```
 -- Required version for terraform is "=1.1.0"
 -- Required versions for aws is "~> 3.70.0"
 ```


## The S3 resource consists of:
```
 --aws s3 bucket
 --aws s3 bucket acl
 --aws s3 bucket policy
 
 ```
 
## Terraform commands
```
    terraform init
    terraform plan -var-file="terraform.tfvars"
    terraform apply -var-file="terraform.tfvars" --auto-approve 
    terraform destroy var-file="terraform.tfvars" --auto-approve 
```