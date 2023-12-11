aws_region              = "eu-west-1" #Please change according to your region preference
lambda_function_name    = "<placeholder>_lambda_function" #Please change the name
s3_bucket_name          = "<placeholder>" #Please change the name
lambda_runtime          = "python3.8"
lambda_handler          = "lambda_function.lambda_handler"
lambda_zip_path         = "./lambda_function.zip"
lambda_layer_zip_path   = "./mylib_layer.zip"
lambda_layer_name       = "<placeholder>_lambda_layer" #Please change the name
