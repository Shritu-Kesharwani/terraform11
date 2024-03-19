# Provider-1 for us-east-1 (Default Provider)
provider "aws" {
  region = "ap-south-1"
}

#Another provider alias 
provider "aws" {
  region = "us-east-1"
  alias = "america"
}

resource "aws_s3_bucket" "test" {
  bucket = "del-hyd-bucket"

}
resource "aws_s3_bucket" "test2" {
  bucket = "del-hyd-buckettwo"
  provider = aws.america  #provider.value of alias
  
}