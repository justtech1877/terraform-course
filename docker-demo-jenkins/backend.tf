
terraform {
  backend "s3" {
      profile = "${var.PROFILE}"
      bucket = "terraform-state-c29df1kjsadfkjb"
      key    = "terraform.tfstate"
      region = "eu-west-2"
  }
}

