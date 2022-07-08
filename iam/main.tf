resource "aws_iam_role" "lambda_role" {
  name = var.role_name                
  assume_role_policy = var.assume_role_policy
  tags = var.tags
}

resource "aws_iam_policy" "customer_policy" {
  count = var.create_iam_policy ? 1 : 0
  name        = var.policy_name                                
  path        = "/"
  description = var.iam_description
  policy      = var.policy
}

resource "aws_iam_role_policy_attachment" "sns_policy_attached" {
  count = var.create_iam_policy ? 1 : 0
  role       = aws_iam_role.lambda_role.name                   
  policy_arn = aws_iam_policy.customer_policy[0].arn                                        
}


resource "aws_iam_role_policy_attachment" "aws_managed_policy_attached" {
  role       = aws_iam_role.lambda_role.name

  for_each   = toset(var.aws_managed_policy)                    
  policy_arn = "arn:aws:iam::aws:policy/${each.value}"                       
}