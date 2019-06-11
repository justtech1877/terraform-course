terraform {
  backend "s3" {
      profile = "cr-labs-skill-up"
      bucket = "terraformstates-tfst19"
      key = "terraform/demo8"
      region = "eu-west-2"
  }

}