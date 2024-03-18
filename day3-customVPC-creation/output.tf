output "publicIP" {
    value = aws_instance.terraEC2.public_ip
  
}

output "privateIP" {
    value = aws_instance.terraEC2.private_ip
}