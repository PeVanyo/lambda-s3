terraform {
  backend "s3" {
    profile = "<placeholder>"
    bucket  = "terraform-state-files-<placeholder>" #Please edit the name
    key     = "terraform.tfstate"
    region  = "eu-west-1"
  }
}
