output "tf-demo12-instance" {
  value = "${aws_instance.tf-demo12.public_ip}"
}
output "rds" {
  value = "${aws_db_instance.mariadb.endpoint}"
}
