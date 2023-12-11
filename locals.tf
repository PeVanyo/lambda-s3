locals {
  tags = {
    Project     = local.project
    CreatedBy   = "terraform"
    Environment = terraform.workspace
  }

  aws_tags = {
    environment = terraform.workspace
    project     = local.project
    creator     = "<placeholder>" #Please change the value
  }

  aws_region     = "eu-west-1"
  project        = "<placeholder>" #Please change the value
  project_prefix = "<placeholder>" #Please change the value

  key_aliases = "${local.project_prefix}-${terraform.workspace}"
}
