terraform {
  backend "s3" {
    profile = "placeholder"
    bucket  = "terraform-state-files-pv-px"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
  }
}
