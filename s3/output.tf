output "public" {
value = aws_instance.tester.public_ip   
}
output "private" {
    value = aws_instance.tester.private_ip
  
}