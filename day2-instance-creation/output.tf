output "publicIP" {
    value = aws_instance.localname.public_ip
  
}

output "privateIP" {
    value = aws_instance.localname.private_ip
}