resource "aws_instance" "tf-packer-demo" {
  ami           = "${var.AMI_ID}"
  instance_type = "t3.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.tf-packer-demo-instance.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mygenkey.key_name}"
}
output "public-ip" {
    value = "${aws_instance.tf-packer-demo.public_ip}"
}