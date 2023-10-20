provider "aws" {
  region = var.aws-region

}

resource "aws_vpc" "tech254-andrew-2tier-vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    tags = {
      Name = var.vpc_name_tag
    }
}

resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.tech254-andrew-2tier-vpc.id
    cidr_block = var.pub_subnet_cidr

    tags = {
      Name = "public-subnet"
    }
}

resource "aws_subnet" "private-subnet" {
    vpc_id = aws_vpc.tech254-andrew-2tier-vpc.id
    cidr_block = var.priv_subnet_cidr

    tags = {
      Name = "private-subnet"
    }
}

resource "aws_internet_gateway" "tech254-andrew-2tier-vpc-ig" {
    vpc_id = aws_vpc.tech254-andrew-2tier-vpc.id

    tags = {
      Name = "tech254-andrew-2tier-vpc-ig"
    }
}

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.tech254-andrew-2tier-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tech254-andrew-2tier-vpc-ig.id
    }

    tags = {
      Name = "public-rt"
    }
}

resource "aws_route_table_association" "route_table_association_cidr" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.public-rt.id
}

resource "aws_security_group" "tech254-andrew-terraform-app" {
    name = "tech254-andrew-terraform-app"
    description = "Allow ssh, port 3000, http"
    vpc_id = aws_vpc.tech254-andrew-2tier-vpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ] 
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

}

resource "aws_instance" "tech254-andrew-app" {
    ami = var.web-app-ami-id
    instance_type = var.instance_type
    subnet_id = aws_subnet.public-subnet.id
    associate_public_ip_address = true
    key_name = var.key-pair
    vpc_security_group_ids = [aws_security_group.tech254-andrew-terraform-app.id]
    
    tags = {
        Name = "tech254-andrew-app"
    }
}
