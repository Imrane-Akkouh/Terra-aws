provider "aws" {
region = "us-east-2"
}

resource "aws_instance" "my_ec2" {
ami = "ami-0629230e074c580f2"
instance_type = "t2.micro"
}