provider "aws" {
  region = local.aws_region
}

terraform {
  required_version = "=1.6.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=4.49.0"
    }
  }
}