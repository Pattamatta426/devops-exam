resource "aws_lambda_function" "my_lambda" {
  function_name    = "devops-exam-lambda"
  role            = data.aws_iam_role.lambda.arn
  handler        = "lambda_function.lambda_handler"
  runtime        = "python3.8"
  filename       = "lambda.zip"
  timeout        = 10
  memory_size    = 128

  vpc_config {
    subnet_ids         = [aws_subnet.private_subnet.id]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }

  tags = {
    Name = "DevOps-Lambda"
  }
}

