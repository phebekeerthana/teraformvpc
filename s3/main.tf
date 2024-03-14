resource "aws_instance" "tester" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name ="keerthana"
    }
  
}