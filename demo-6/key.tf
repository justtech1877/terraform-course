resource "aws_key_pair" "mygenkey" {
  key_name = "mygenkey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
