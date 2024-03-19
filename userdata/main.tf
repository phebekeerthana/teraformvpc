resource "aws_instance" "dev" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.nano"
    key_name = "terraform"
    user_data = file("test.sh")
    tags = {
      Name = "userdata"
       
    }
  
}