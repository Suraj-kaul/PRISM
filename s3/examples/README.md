# terraform-S3-module

 -- Here we are creating module to provision a S3.

## Compatibility
 ```
 -- Required version for terraform is "=1.1.0"
 -- Required version for aws is "~> 3.70.0"
```
 
## Commands
```
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars" --auto-approve 
terraform destroy var-file="terraform.tfvars" --auto-approve 
```
