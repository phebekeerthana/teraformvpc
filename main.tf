#create vpc
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "dev"
    }
  
}
#create ig
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
  
}
#create subnets
resource "aws_subnet" "dev" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
  
}
#create route tables & edit routes attach to ig
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id
    }
  
}
#subnet association
resource "aws_route_table_association" "dev" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.dev.id
  
}
#create instance
resource "aws_instance" "dev" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.dev.id
  tags = {
    Name = "myec2"
  }
}