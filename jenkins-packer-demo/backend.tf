
terraform {
  backend "s3" {
      profile = "cr-labs-skill-up"
      bucket = "terraform-state-c29df1kjsadfkjb"
      key    = "terraform.tfstate"
      region = "eu-west-2"
  }
}

