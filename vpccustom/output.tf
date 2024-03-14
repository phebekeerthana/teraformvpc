output "public" {
    value = aws_instance.dev.public_ip
    sensitive = false

  
}