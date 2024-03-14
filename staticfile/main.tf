resource "aws_s3_bucket" "tester" {
    bucket = "static-configure"
  
}
resource "aws_dynamodb_table" "dynamodb-terraform" {
  name = "terraform-dynamodb"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 attribute {
   name = "LockID"
    type = "S"
 }
} 