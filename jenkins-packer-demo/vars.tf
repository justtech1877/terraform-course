variable "PROFILE" {}
#variable "AWS_ACCESS_KEY" {}
#variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-2"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mygenkey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mygenkey.pub"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    eu-west-2 = "ami-0009a33f033d8b7b6"
    eu-west-1 = "ami-0cbf7a0c36bde57c9"
  }
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}
variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}

variable "JENKINS_VERSION" {
  default = "2.179"
}
variable "TERRAFORM_VERSION" {
  default = "0.12.1"
}

variable "PACKER_VERSION" {
  default = "1.4.1"
}

variable "APP_INSTANCE_COUNT" {
  default = "0"
}
