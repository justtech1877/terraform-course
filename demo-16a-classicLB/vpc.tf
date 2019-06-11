# Internet VPC
resource "aws_vpc" "stage-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
        Name = "stage-vpc"
    }
}


# Subnets
resource "aws_subnet" "stage-vpc-public-1" {
    vpc_id = "${aws_vpc.stage-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-2a"

    tags = {
        Name = "stage-vpc-public-1"
    }
}
resource "aws_subnet" "stage-vpc-public-2" {
    vpc_id = "${aws_vpc.stage-vpc.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "stage-vpc-public-2"
    }
}
resource "aws_subnet" "stage-vpc-public-3" {
    vpc_id = "${aws_vpc.stage-vpc.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "eu-west-2c"

    tags = {
        Name = "stage-vpc-public-3"
    }
}
resource "aws_subnet" "stage-vpc-private-1" {
    vpc_id = "${aws_vpc.stage-vpc.id}"
    cidr_block = "10.0.11.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-2a"

    tags = {
        Name = "stage-vpc-private-1"
    }
}
resource "aws_subnet" "stage-vpc-private-2" {
    vpc_id = "${aws_vpc.stage-vpc.id}"
    cidr_block = "10.0.12.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-2b"

    tags = {
        Name = "stage-vpc-private-2"
    }
}
resource "aws_subnet" "stage-vpc-private-3" {
    vpc_id = "${aws_vpc.stage-vpc.id}"
    cidr_block = "10.0.13.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "eu-west-2c"

    tags = {
        Name = "stage-vpc-private-3"
    }
}

# Internet GW
resource "aws_internet_gateway" "stage-vpc-igw" {
    vpc_id = "${aws_vpc.stage-vpc.id}"

    tags = {
        Name = "stage-vpc-IGW"
    }
}

# route tables
resource "aws_route_table" "stage-vpc-public" {
    vpc_id = "${aws_vpc.stage-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.stage-vpc-igw.id}"
    }

    tags = {
        Name = "stage-vpc-public-1"
    }
}

# route associations public
resource "aws_route_table_association" "stage-vpc-public-1-a" {
    subnet_id = "${aws_subnet.stage-vpc-public-1.id}"
    route_table_id = "${aws_route_table.stage-vpc-public.id}"
}
resource "aws_route_table_association" "stage-vpc-public-2-a" {
    subnet_id = "${aws_subnet.stage-vpc-public-2.id}"
    route_table_id = "${aws_route_table.stage-vpc-public.id}"
}
resource "aws_route_table_association" "stage-vpc-public-3-a" {
    subnet_id = "${aws_subnet.stage-vpc-public-3.id}"
    route_table_id = "${aws_route_table.stage-vpc-public.id}"
}
