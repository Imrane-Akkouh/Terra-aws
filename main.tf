provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0629230e074c580f2"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.security_group.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "hello, from Terraform" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    name = "Terraform-Training"
  }
}

resource "aws_security_group" "security_group" {

  name = "terraform security group"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
