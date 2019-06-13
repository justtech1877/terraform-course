provider "aws" {
  #   access_key = "${var.AWS_ACCESS_KEY}"
  #   secret_key = "${var.AWS_SECRET_KEY}"
  profile = var.PROFILE
  region  = var.AWS_REGION
}

