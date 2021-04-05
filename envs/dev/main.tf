module "api_gateway" {
  source     = "../../module/api-gateway"
  lambda_arn = module.lambda.lambda_arn
}

module "lambda" {
  source                           = "../../module/lambda"
  api_gateway_sample_execution_arn = module.api_gateway.api_gateway_sample_execution_arn
}
