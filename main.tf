provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_instance" "first_example" {
  ami           = "ami-033a6a056910d1137"
  instance_type = "t2.micro"
  subnet_id     = "	subnet-0933e21aa3354cdb8"
  tags = {
    "Name" = "terraform-control-node"
  }
}
