terraform {
  backend "s3" {
      profile = "cr-labs-skill-up"
      bucket = "terraformstates-tfst19"
      key = "terraform/demo4"
      region = "eu-west-2"
  }

}