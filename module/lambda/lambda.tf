data "archive_file" "sample" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/upload/lambda.zip"
}

resource "aws_lambda_function" "sample" {
  filename      = data.archive_file.sample.output_path
  function_name = "SampleLambdaHelloWorld"
  role          = aws_iam_role.lambda_sample.arn
  handler       = "main.lambda_handler"

  source_code_hash = data.archive_file.sample.output_base64sha256

  runtime = "python3.8"

  tracing_config {
    mode = "Active" # Activate AWS X-Ray
  }

  environment {
    variables = {
      SAMPLE_ENV = "SAMPLE_VALUE"
    }
  }

  timeout                        = 29
  reserved_concurrent_executions = 50
  publish                        = true
}

resource "aws_lambda_permission" "sample" {
  statement_id  = "AllowAPIGatewaySample"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sample.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.api_gateway_sample_execution_arn}/*/*"
}
