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

variable "allowed_account_ids" {
  description = "List of allowed AWS account ids where resources can be created"
  type = "list"
  #default = []
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  #default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  #default     = "0.0.0.0/0"
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = "list"
  #default     = []
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = "list"
  #default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = "list"
  #default     = []
}