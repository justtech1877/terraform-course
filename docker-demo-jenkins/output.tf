output "elb" {
  value = "${aws_elb.nodejs-app-elb.dns_name}"
}

output "jenkins" {
  value = "${aws_instance.jenkins-instance.public_ip}"
}

output "nodejs-app-repository-URL" {
  value = "${aws_ecr_repository.nodejs-app.repository_url}"
}