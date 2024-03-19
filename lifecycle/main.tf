resource "aws_instance" "dev" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.nano"
    key_name = "terraform"
  subnet_id = "subnet-084aa956d49bfd5cb"
    tags = {
      Name = "userdata"
       
    }
    # lifecycle {
    #   create_before_destroy = true
    # }
    # lifecycle {
    #   prevent_destroy = true
    # }
#     lifecycle {
#       ignore_changes = [ tags ]
#     }
 } 
