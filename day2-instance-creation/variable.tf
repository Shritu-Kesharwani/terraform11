variable "ami_id" {
    type = string
    default = "ami-0ba259e664698cbfc"
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "key_name" {
  type = string
  default = "devsecopskey"
}