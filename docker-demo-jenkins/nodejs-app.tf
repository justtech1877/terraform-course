# nodejs-app

data "template_file" "nodejs-app-task-template" {
  template               = "${file("templates/nodejs-app.json.tpl")}"
  vars = {
    REPOSITORY_URL = "${replace("${var.ECR_REPOSITORY_URL}", "https://", "")}",
    APP_VERSION = "${var.NODEJS_APP_VERSION}"
  }
}

resource "aws_ecs_task_definition" "nodejs-app-task" {
  family                = "nodejs-app"
  container_definitions = "${data.template_file.nodejs-app-task-template.rendered}"
}

resource "aws_elb" "nodejs-app-elb" {
  name = "nodejs-app-elb"

  listener {
    instance_port = 3000
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 3
    unhealthy_threshold = 3
    timeout = 30
    target = "HTTP:3000/"
    interval = 60
  }

  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400

  subnets = ["${aws_subnet.main-public-1.id}","${aws_subnet.main-public-2.id}"]
  security_groups = ["${aws_security_group.nodejs-app-elb-securitygroup.id}"]

  tags = {
    Name = "nodejs-app-elb"
  }
}

resource "aws_ecs_service" "nodejs-app-service" {
  count = "${var.NODEJS_APP_SERVICE_ENABLE}"
  name = "nodejs-app"
  cluster = "${aws_ecs_cluster.nodejs-app-cluster.id}"
  task_definition = "${aws_ecs_task_definition.nodejs-app-task.arn}"
  desired_count = 1
  iam_role = "${aws_iam_role.ecs-service-role.arn}"
  depends_on = ["aws_iam_policy_attachment.ecs-service-attach1"]

  load_balancer {
    elb_name = "${aws_elb.nodejs-app-elb.name}"
    container_name = "nodejs-app"
    container_port = 3000
  }
  lifecycle { ignore_changes = ["task_definition"] }
}

