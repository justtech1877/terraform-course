variable "PROFILE" {}
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "eu-west-2"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-13be557e"
    eu-west-2 = "ami-0009a33f033d8b7b6"
    eu-west-1 = "ami-08eb05c142193af92"
  }
}
