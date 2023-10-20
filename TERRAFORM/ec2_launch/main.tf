# Who is the cloud provider:
provider "aws" {

# Where is the region:
  region = var.aws-region

}

# to download required dependencies.

# create a server/resource on the cloud - ec2 on AWS

resource "aws_instance" "andrew-iac-test" {
  ami = var.web-app-ami-id
  instance_type = var.instance_size
  tags = {
    Name = var.tag-name
  }


}
