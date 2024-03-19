resource "aws_instance" "localinst" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.sub.id
    security_groups = [data.aws_security_group.SecGroup.id]
    tags = {
      Name = "terraEC2"
    }
}