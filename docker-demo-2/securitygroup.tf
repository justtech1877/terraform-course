resource "aws_security_group" "ecs-securitygroup" {
  vpc_id = "${aws_vpc.main.id}"
  name = "ecs"
  description = "security group for ecs"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 3000
      to_port = 3000
      protocol = "tcp"
      security_groups = ["${aws_security_group.nodejs-app-elb-securitygroup.id}"]
  } 
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["185.100.71.242/32"]
  } 
  tags = {
    Name = "ecs"
  }
}
resource "aws_security_group" "nodejs-app-elb-securitygroup" {
  vpc_id = "${aws_vpc.main.id}"
  name = "nodejs-app-elb"
  description = "security group for ecs"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
  tags = {
    Name = "nodejs-app-elb"
  }
}
