# scale up alarm

resource "aws_autoscaling_policy" "tf-demo15-cpu-policy-scaleup" {
  name                   = "tf-demo15-cpu-policy-scaleup"
  autoscaling_group_name = "${aws_autoscaling_group.tf-demo15-autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "tf-demo15-cpu-alarm" {
  alarm_name          = "tf-demo15-cpu-alarm"
  alarm_description   = "tf-demo15-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.tf-demo15-autoscaling.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.tf-demo15-cpu-policy-scaleup.arn}"]
}

# scale down alarm
resource "aws_autoscaling_policy" "tf-demo15-cpu-policy-scaledown" {
  name                   = "tf-demo15-cpu-policy-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.tf-demo15-autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "tf-demo15-cpu-alarm-scaledown" {
  alarm_name          = "tf-demo15-cpu-alarm-scaledown"
  alarm_description   = "tf-demo15-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.tf-demo15-autoscaling.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.tf-demo15-cpu-policy-scaledown.arn}"]
}
