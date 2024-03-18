resource "aws_instance" "dev" {
    ami = "ami-0ba259e664698cbfc"
    instance_type = "t2.micro"
    key_name = "terraform"
    subnet_id = data.aws_subnet.dev.id
    security_groups = [data.aws_security_group.dev.id]
    tags = {
      Name = "ec2"
    }
  
}