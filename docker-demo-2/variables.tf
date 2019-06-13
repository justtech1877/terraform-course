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
variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}
variable "ECS_INSTANCE_TYPE" {
  default = "t3.micro"
}
variable "ECS_AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-0f812849f5bc97db5"
    eu-west-2 = "ami-0bcdb1fbd79cc1a6f"
    eu-west-1 = "ami-0d9430336a60e81c5"
  }
}

variable "ECR_REPOSITORY_URL" {
  default = "880216566757.dkr.ecr.eu-west-2.amazonaws.com/nodejs-app"
}

# Full List: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
