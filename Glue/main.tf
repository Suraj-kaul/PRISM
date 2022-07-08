resource "aws_glue_catalog_database" "mydb" {
  name = var.catlogue_db_name  

}

resource "aws_glue_crawler" "test_crawler" {
  database_name = aws_glue_catalog_database.mydb.name
  name          = var.crawler_name 
  role          = var.glue_role_arn

  s3_target {
    path = "s3://${var.source_bucket}"
  }
  tags = var.tags
}



resource "aws_glue_job" "example" {
  count= var.create_glue_job ? 1:0
  name     = var.job_name
  role_arn = var.glue_role_arn

  command {
    script_location = "s3://${var.bucket}"
  }
  tags = var.tags
}




