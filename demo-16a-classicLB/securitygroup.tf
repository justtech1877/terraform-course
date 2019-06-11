resource "aws_security_group" "tf-demo16-instance" {
  vpc_id = "${aws_vpc.stage-vpc.id}"
  name = "tf-demo16-instance"
  description = "security group for tf-demo16-instance"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["185.100.71.242/32"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      security_groups = ["${aws_security_group.elb-securitygroup.id}"]
  }

  tags = {
    Name = "tf-demo16-instance"
  }
}
resource "aws_security_group" "elb-securitygroup" {
  vpc_id = "${aws_vpc.stage-vpc.id}"
  name = "elb"
  description = "security group for load balancer"
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
    Name = "stage-vpc-elb"
  }
}
