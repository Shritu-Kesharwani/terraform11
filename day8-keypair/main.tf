resource "aws_key_pair" "dev" {
key_name = "devopskey"
public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "server" {
  ami                    = "ami-0ba259e664698cbfc"
  instance_type          = "t2.micro"
  key_name               =  aws_key_pair.dev.key_name
  tags = {
      Name = "terraec2"
  } 
}