provider "aws" {
  region = "ap-northeast-2"
}
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "first_example" {
  ami                         = "ami-033a6a056910d1137"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.instance.id]
  subnet_id                   = "subnet-0933e21aa3354cdb8"
  associate_public_ip_address = "true"
  user_data                   = <<-EOF
                #!/bin/bash
                echo "Hello JJ" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
  tags = {
    "Name" = "terraform-control-node"
  }
}
