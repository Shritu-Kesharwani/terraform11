output "publicIP" {
    value = aws_instance.instanceEC2.public_ip
  
}

output "privateIP" {
    value = aws_instance.instanceEC2.private_ip
}