locals {
  lambda_source_file  = "demo.py"
  lambda-zip-location= "outputs/main.zip"                                  
}

data "archive_file" "lambda_zip" {                                                              
    type    = "zip" 
    source_file = local.lambda_source_file
    output_path = local.lambda-zip-location                                                 
}
module "lambda" {
    source = "../"
    filename = data.archive_file.lambda_zip.output_path
    function_name    = "Prism-lambda-function"
    description      = "Demo lambda function for Prism POC"
    handler          = "demo.lambda_handler"
    source_code_hash = filebase64sha256("${data.archive_file.lambda_zip.output_path}")

    create_lambda_layer        = false
    create_eventbridge_trigger = false
    # event_rule_name            = var.event_rule_name
    # event_description          = var.event_description
    # event_schedule_expression  = var.event_schedule_expression
    # event_statement_id         = var.event_statement_id
    # event_action               = var.event_action
    # event_principal            = var.event_principal

    tags = merge({"Owner"="aakash"},
        { Function = format("%s", "Prism-lambda-function") }
  )
}