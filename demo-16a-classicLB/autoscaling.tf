resource "aws_launch_configuration" "tf-demo16-launchconfig" {
  name_prefix          = "tf-demo16-launchconfig"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t3.micro"
  key_name             = "${aws_key_pair.mygenkey.key_name}"
  security_groups      = ["${aws_security_group.tf-demo16-instance.id}"]
  user_data            = "#!/bin/bash\nyum update -y\nyum -y install nginx\nMYIP=`ifconfig | grep 'addr:10' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'this is: '$MYIP > /var/www/html/index.html"
  lifecycle              { create_before_destroy = true }
}

resource "aws_autoscaling_group" "tf-demo16-autoscaling" {
  name                 = "tf-demo16-autoscaling"
  vpc_zone_identifier  = ["${aws_subnet.stage-vpc-public-1.id}", "${aws_subnet.stage-vpc-public-2.id}"]
  launch_configuration = "${aws_launch_configuration.tf-demo16-launchconfig.name}"
  min_size             = 2
  max_size             = 2
  health_check_grace_period = 300
  health_check_type = "ELB"
  load_balancers = ["${aws_elb.stage-vpc-elb.name}"]
  force_delete = true

  tag {
      key = "Name"
      value = "stage-vpc tf-demo16-instance"
      propagate_at_launch = true
  }
}

