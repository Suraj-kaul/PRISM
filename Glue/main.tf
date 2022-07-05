resource "aws_glue_catalog_database" "mydb" {
  name = var.catlogue_db_name  
}

resource "aws_glue_crawler" "test_crawler" {
  database_name = aws_glue_catalog_database.mydb.name
  name          = var.crawler_name 
  role          = var.role 

  s3_target {
    path = "s3://${var.source_bucket}"
  }
}


