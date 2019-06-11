
provider "aws" {
profile = "cr-labs-skill-up"
region = "eu-west-2"
}


resource "aws_instance" "test1" {
  ami           = "ami-0009a33f033d8b7b6"
  instance_type = "t2.micro"
  subnet_id = "subnet-03a8c8d5250f6691a"
  vpc_security_group_ids = [
              "sg-06d19beef288595d4"]
}