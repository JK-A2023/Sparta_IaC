# Who is the cloud provider:
provider "aws" {

# Where is the region:
  region = aws-region

}

# to download required dependencies.

# create a server/resource on the cloud - ec2 on AWS

resource "aws_instance" "andrew-iac-test" {
  ami = "ami-0943382e114f188e8"
  instance_type = "t2.micro"
  tags = {
    Name = "andrew-iac-tf-test"
  }


}
