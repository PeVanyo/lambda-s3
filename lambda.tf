resource "aws_lambda_function" "lambda_function" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  role          = aws_iam_role.lambda_service_role.arn
  filename      = var.lambda_zip_path
  
  layers        = [aws_lambda_layer_version.lambda_layer.arn]
}

resource "aws_lambda_layer_version" "lambda_layer" {
  filename            = var.lambda_layer_zip_path
  layer_name          = var.lambda_layer_name
  compatible_runtimes = [var.lambda_runtime]
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.lambda_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda_function.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.lambda_bucket.arn
}
