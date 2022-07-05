# resource "aws_s3_bucket" "example" {
#   count = var.aws_s3_bucket ? 1:0
#   bucket = var.bucket
# }

resource "aws_athena_database" "example" {
  count = var.aws_athena_database ? 1:0
  name   = var.database_name
  # bucket = var.aws_s3_bucket == true ? aws_s3_bucket.example[0].bucket : var.demo_bucket
  bucket = var.athena_bucket
}

resource "aws_athena_data_catalog" "example" {
  count = var.aws_athena_data_catalog ? 1:0
  name        = var.data_catalog_name
  description = var.description_data_catalog
  type        = var.type

  parameters = var.catalog_parameters

}
resource "aws_athena_named_query" "foo" {
  count = var.aws_athena_named_query ? 1:0
  name      = var.query_name
  workgroup = aws_athena_workgroup.athena_workgroup[0].name
  database  = aws_athena_database.example[0].name
  query     = "SELECT * FROM ${var.data_catalog_name} limit 10;"
}

resource "aws_athena_workgroup" "athena_workgroup" {
  count = var.aws_athena_workgroup? 1:0
  name = var.athena_workgroup_name


  configuration {
    enforce_workgroup_configuration    = var.enforce_workgroup_configuration 
    publish_cloudwatch_metrics_enabled = var.publish_cloudwatch_metrics_enabled

    result_configuration {
      output_location =  "s3://${var.destination_bucket}/output/"

      encryption_configuration {
        encryption_option =  var.encryption_option
       
      }
    }
  }
  # depends_on = [aws_s3_bucket.example]
}