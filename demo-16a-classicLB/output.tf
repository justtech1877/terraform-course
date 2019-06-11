output "ELB" {
	value = "${aws_elb.stage-vpc-elb.dns_name}"
}
