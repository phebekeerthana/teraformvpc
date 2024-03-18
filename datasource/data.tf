provider "aws" {
  
}
data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}


data "aws_security_group" "dev" {
    id = "sg-070af86415bd23c8a"
  
}
data "aws_subnet" "dev" {
    id = "subnet-0d51aa880b8324de2"
  
}