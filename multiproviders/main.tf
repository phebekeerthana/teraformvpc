provider "aws" {
    region = "ap-south-1"
  
}
provider "aws" {
    region = "us-east-1"
    alias = "usa"
  
}
resource "aws_s3_bucket" "dev" {
  bucket = "bbluebug"
}
resource "aws_s3_bucket" "dev1" {
  bucket = "devbluebugg"
  provider = aws.usa
}