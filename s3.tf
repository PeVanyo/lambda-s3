resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.s3_bucket_name
  tags   = merge(local.aws_tags, { service = "s3" })
}

resource "aws_s3_bucket_public_access_block" "s3-access-block" {
  bucket = aws_s3_bucket.lambda_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "lambda_bucket_policy" {
  bucket = aws_s3_bucket.lambda_bucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = aws_iam_role.lambda_service_role.arn
        },
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.lambda_bucket.arn}/*"
      }
    ]
  })
}
