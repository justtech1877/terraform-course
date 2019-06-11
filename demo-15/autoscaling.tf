resource "aws_launch_configuration" "tf-demo15-launchconfig" {
  name_prefix          = "tf-demo15-launchconfig"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t3.micro"
  key_name             = "${aws_key_pair.mygenkey.key_name}"
  security_groups      = ["${aws_security_group.tf-demo15-instance.id}"]
}

resource "aws_autoscaling_group" "tf-demo15-autoscaling" {
  name                 = "tf-demo15-autoscaling"
  vpc_zone_identifier  = ["${aws_subnet.stage-vpc-public-1.id}", "${aws_subnet.stage-vpc-public-2.id}"]
  launch_configuration = "${aws_launch_configuration.tf-demo15-launchconfig.name}"
  min_size             = 1
  max_size             = 2
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true

  tag {
      key = "Name"
      value = "tf-demo15 instance"
      propagate_at_launch = true
  }
}

