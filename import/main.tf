resource "aws_instance" "dev" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.nano"
    tags = {
      Name = "import"
    }                               #import aws_instance.dev instance id
 
}
resource "aws_s3_bucket" "dev" {
  
}