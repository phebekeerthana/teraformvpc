resource "aws_instance" "dev" {
    ami = "ami-0ba259e664698cbfc"
    instance_type = "t2.micro"
    key_name = "terraform"
    tags = {
      Name = "demo"
    }
  
}
resource "aws_s3_bucket" "dev" {
    bucket = "fdgkkkdd"
    depends_on = [ aws_instance.dev ]
}