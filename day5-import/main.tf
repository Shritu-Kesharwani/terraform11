resource "aws_instance" "instance" {
  ami = "ami-013168dc3850ef002"
  instance_type = "t2.micro"
  key_name = "devsecopskey"
  tags = {
    Name = "manualEC2"
  }
}