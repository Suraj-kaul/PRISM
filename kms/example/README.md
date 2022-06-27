# terraform-kms-key

 -- Here we are creating module to provision a AWS KMS key.

## Compatibility
 ```
 -- Required version for terraform is "=1.1.0"
 -- Required version for aws is "~> 3.70.0"
```
 
## Commands
```
terraform init
terraform plan -var-file="dev/terraform.tfvars"
terraform apply -var-file="dev/terraform.tfvars" --auto-approve 
terraform destroy var-file="dev/terraform.tfvars" --auto-approve 
```
