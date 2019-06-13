output "elb" {
  value = "${aws_elb.nodejs-app-elb.dns_name}"
}

