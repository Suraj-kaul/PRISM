#Resource: aws_kms_key
resource "aws_kms_key" "this" {
  count = var.kms_enabled ? 1 : 0

  description              = var.kms_description
  deletion_window_in_days  = var.deletion_window_in_days
  is_enabled               = var.is_enabled
  policy                   = var.kms_policy
  customer_master_key_spec = var.customer_master_key_spec
  enable_key_rotation      = var.enable_key_rotation
  multi_region             = var.multi_region
  key_usage                = var.key_usage

  tags                     = var.tags
}

#Resource: aws_kms_alias
resource "aws_kms_alias" "this" {
  count = var.kms_enabled ? 1 : 0

  name          = "alias/${var.alias_name}"
  target_key_id = try(aws_kms_key.this[0].key_id, "")
}

#Resource: aws_kms_ciphertext
resource "aws_kms_ciphertext" "this" {
  count = var.enable_kms_ciphertext ? 1 : 0

  key_id    = try(aws_kms_key.this[0].key_id, "")
  plaintext = try(var.Secret_data, "")
}