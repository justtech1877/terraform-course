variable "PROFILE" {}
#variable "AWS_ACCESS_KEY" {}
#variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-2"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    eu-west-2 = "ami-0009a33f033d8b7b6"
    eu-west-1 = "ami-0cbf7a0c36bde57c9"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mygenkey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mygenkey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
variable "RDS_PASSWORD" { }
