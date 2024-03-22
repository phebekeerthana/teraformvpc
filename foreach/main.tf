variable "ami" {
    type = string
    default = "ami-0ba259e664698cbfc"
  
}
variable "instance_type" {
    type = string
    default = "t2.nano"
  
}
variable "instances" {
    type = list(string)
    default = [ "devloper","tester","operater" ]
  
}

resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.instance_type
    for_each = toset(var.instances)
    tags = {
      Name = each.value
    }
  
}