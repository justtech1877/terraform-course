terraform {
  backend "s3" {
      profile = "cr-labs-skill-up"
      bucket = "terraformstates-tfst19"
      key = "terraform/demo9"
      region = "eu-west-2"
  }

}