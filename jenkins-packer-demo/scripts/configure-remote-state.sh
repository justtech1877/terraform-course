#!/bin/bash

set -ex

echo "Newer terraform versions have a new way of defining a backend. Copy paste the following code in a backend.tf file, modify the region/s3 bucket, and execute 'terraform init' to initialize the backend. You'll be asked to copy the data from the local backend to the s3 backend, which you can answer yes.
"
echo '
terraform {
  backend "s3" {
      profile = "cr-labs-skill-up"
      bucket = "terraform-state-c29df1kjsadfkjb"
      key    = "terraform.tfstate"
      region = "eu-west-2"
  }
}
' > backend.tf

terraform init

#terraform remote config -backend=s3 -backend-config="bucket = terraform-state-c29df1kjsadfkjb" -backend-config="key=terraform/terraform.tfstate" -backend-config="region = eu-west-2"


  