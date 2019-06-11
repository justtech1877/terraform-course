resource "aws_instance" "tf-demo12" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t3.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.tf-demo12-instance.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mygenkey.key_name}"

}
