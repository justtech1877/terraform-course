resource "aws_instance" "tf-demo4" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
    subnet_id = "subnet-03a8c8d5250f6691a"
  vpc_security_group_ids = [
              "sg-06d19beef288595d4"]
  provisioner "local-exec" {
     command = "echo ${aws_instance.tf-demo4.private_ip} >> private_ips.txt"
  }
}
output "ip" {
    value = "${aws_instance.tf-demo4.public_ip}"
}
