resource "aws_key_pair" "dev" {
    key_name = "devloper"
    public_key = file("~/.ssh/id_rsa.pub")
  
}

# resource "aws_instance" "devloper" {
#     ami = "ami-013168dc3850ef002"
#     instance_type = "t2.micro"
#     key_name = aws_key_pair.dev.key_name
  
# }
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
  
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
  
}
resource "aws_subnet" "mysub" {
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"
    vpc_id = aws_vpc.myvpc.id
}
resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.myvpc.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
  
}
resource "aws_route_table_association" "RTA" {
    subnet_id = aws_subnet.mysub.id
    route_table_id = aws_route_table.RT.id
  
}
resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.myvpc.id
    name = "mysg"
  ingress  {
      description = "ssh"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
   
  }
  ingress {
    description = "HTTP from vpc"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
resource "aws_instance" "demo" {
    ami = "ami-013168dc3850ef002"
    instance_type =  "t2.micro"
    availability_zone = "ap-south-1a"
    key_name = aws_key_pair.dev.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    subnet_id = aws_subnet.mysub.id

  connection {
    type = "ssh"
    user = "ec2-user"
    # private_key = file("C:/Users/priya/.ssh/id_ed25519")
    private_key = file("~/.ssh/id_rsa")
    host = self.public_ip
  }
#   provisioner "local-exec" {
#     command = "touch file1"
#   } 
  provisioner "file" {
  source      = "file1"
  destination = "/home/ec2-user/file1"
}

  provisioner "remote-exec" {
    inline = [ 
        "touch file2",
        "echo welcome to bli >> file2",
     ]
    
  }
}
