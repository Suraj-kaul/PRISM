resource "aws_lambda_function" "this" {
  filename                       = var.filename                                      
  function_name                  = var.function_name                                  
  description                    = var.description
  role                           = var.role_arn                                                             
  handler                        = var.handler                                         
  runtime                        = var.runtime                                        
  source_code_hash               = var.source_code_hash                      
  publish                        = var.publish
  memory_size                    = var.memory_size
  timeout                        = var.lambda_timeout
  reserved_concurrent_executions = var.concurrency
  tags                           = var.tags
  layers                         = try(aws_lambda_layer_version.this.*.arn, [])

  # dynamic "vpc_config" {
  #   for_each = var.vpc_config == null ? [] : [var.vpc_config]
  #   content {
  #     security_group_ids = vpc_config.value.security_group_ids
  #     subnet_ids         = vpc_config.value.subnet_ids
  #   }
  # }

  dynamic "environment" {
    for_each = var.environment == null ? [] : [var.environment]
    content {
      variables = var.environment
    }
  }

  lifecycle {
    ignore_changes = [
      filename,
    ]
  }

  depends_on = [aws_cloudwatch_log_group.this]
}

# Lambda layer
resource "aws_lambda_layer_version" "this" {

  count = var.create_lambda_layer ? 1:0

  filename            = var.layer_filename                                                  
  layer_name          = var.layer_name                            
  source_code_hash    = var.layer_source_code_hash                             
  compatible_runtimes = var.compatible_runtimes                               
  description         = var.layer_description        
}

# Cloud watch
resource "aws_cloudwatch_log_group" "this" {
  name              = format("/aws/lambda/%s", var.function_name)
  retention_in_days = var.log_retention

  tags = merge(var.tags,
    { Function = format("%s", var.function_name) }
  )
}

#cloudwatch eventbridge trigger
resource "aws_cloudwatch_event_rule" "this" {

    count = var.create_eventbridge_trigger ? 1:0

    name                = var.event_rule_name                           
    description         = var.event_description                  
    schedule_expression = var.event_schedule_expression        
}

resource "aws_cloudwatch_event_target" "this" {

    count = var.create_eventbridge_trigger ? 1:0

    rule      = try(aws_cloudwatch_event_rule.this[0].name, "")                                        
    target_id = var.event_target_id                                                 
    arn       = try(aws_lambda_function.this.arn, "")                                                  
}

resource "aws_lambda_permission" "this" {

    count = var.create_eventbridge_trigger ? 1:0

    statement_id  = var.event_statement_id                                              
    action        = var.event_action                                                     
    function_name = var.function_name                                             
    principal     = var.event_principal                                                  
    source_arn    = try(aws_cloudwatch_event_rule.this[0].arn, "")                                         
}