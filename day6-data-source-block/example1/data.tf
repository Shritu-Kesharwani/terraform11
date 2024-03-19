data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

data "aws_security_group" "SecGroup" {
  id = "sg-0cb2cad9a6e253ea3" #here change your sg id details"

}
data "aws_subnet" "sub" {
  id = "subnet-0c8e43cb0a381de9c" #here chnage your subnet id details
}