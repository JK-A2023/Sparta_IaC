# Who is the cloud provider:
provider "aws" {
  region = var.aws-region

}

resource "aws_instance" "andrew-iac-test" {
  ami = var.web-app-ami-id
  instance_type = var.instance_size
  tags = {
    Name = var.tag-name
  }
}
