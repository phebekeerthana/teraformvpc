# resource "aws_instance" "dev" {
#     ami = "ami-0ba259e664698cbfc" 
#     instance_type = "t2.micro"
#     count = 2
#     tags = {                                             #without list variable
#       Name = "myEc2-${count.index}"
#     }
# }
#--------------------------------------------------
# resource "aws_instance" "dev" {
#     ami = var.ami
#     instance_type = var.instance_type
#     count = length(var.myinstance)
#     tags = {
#       Name = var.myinstance[count.index]             #with variables list of string
#     } 
  
# }
# resource "aws_instance" "dev" {
#   ami           = var.ami
#   instance_type = var.instance_type
#   count         = var.instance_type == "t2.micro" ? 1 : 0
#   tags = {
#     Name = "dev_server"
#   }
# }