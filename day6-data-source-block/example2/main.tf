data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    values = ["customVPC"] #giv your vpc name 
  }
}

data "aws_subnet" "subnet" {
  filter {
    name = "tag:Name"
    values = ["custSubPub"] # give your subnet name 
  }
}

resource "aws_security_group" "dev" {
  name        = "allow_tls"
  vpc_id      = data.aws_vpc.vpc.id
  tags = {
    Name = "dev_sg"
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


resource "aws_instance" "proj-instance" {
  ami ="ami-013168dc3850ef002"
  instance_type = "t2.micro"
  key_name= "testkey"
  vpc_security_group_ids = [ aws_security_group.dev.id ]
  subnet_id =  data.aws_subnet.subnet.id
  tags = {
    Name = "DataSource- Instance"
  }
}