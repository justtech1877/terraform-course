resource "aws_instance" "tf-demo9" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t3.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mygenkey.key_name}"
}

resource "aws_ebs_volume" "ebs-volume-1" {
    availability_zone = "eu-west-2a"
    size = 10
    type = "gp2" 
    tags = {
        Name = "extra volume data"
    }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.tf-demo9.id}"
}

output "ip" {
    value = "${aws_instance.tf-demo9.public_ip}"
}