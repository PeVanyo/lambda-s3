locals {
  tags = {
    Project     = local.project
    CreatedBy   = "terraform"
    Environment = terraform.workspace
  }

  aws_tags = {
    environment = terraform.workspace
    project     = local.project
    creator     = "Peter Vanyo"
  }

  aws_region     = "eu-west-1"
  project        = "px"
  project_prefix = "pv"

  key_aliases = "${local.project_prefix}-${terraform.workspace}"
}
