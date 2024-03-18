#create VPC

resource "aws_vpc" "customVPC" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "customVPC"
    }
  
}

#create internet gateway and attach to vpc

resource "aws_internet_gateway" "custIG" {
  vpc_id = aws_vpc.customVPC.id
  tags = {
    Name =" custIG"
  }
}

#create subnets
resource "aws_subnet" "customSubPub" {
    vpc_id = aws_vpc.customVPC.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "custSubPub"
    }

}

#cretae Route tables & attach internet gateway to Rt

resource "aws_route_table" "custPRT" {
    vpc_id = aws_vpc.customVPC.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.custIG.id
    }



}
  

#subent associations
resource "aws_route_table_association" "name" {
    route_table_id = aws_route_table.custPRT.id
    subnet_id = aws_subnet.customSubPub.id
  
}

#Security Group
resource "aws_security_group" "customSG" {
  name        = "customSG"
  vpc_id      = aws_vpc.customVPC.id
  tags = {
    Name = "customSG"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  }

#EC2 creation
resource "aws_instance" "terraEC2" {
  ami = var.amiID
  instance_type = var.instance_typeID
  key_name = var.keypairvalue
  subnet_id = aws_subnet.customSubPub.id
  associate_public_ip_address = true
  security_groups = [ aws_security_group.customSG.id ]
  tags = {
    Name = "terraEC2"
  }
  
}