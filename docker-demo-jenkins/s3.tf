resource "aws_s3_bucket" "terraform-state" {
    bucket = "terraform-state-c29df1kjsadfkjb"
    acl = "private"

    tags = {
        Name = "Terraform state"
    }
}
