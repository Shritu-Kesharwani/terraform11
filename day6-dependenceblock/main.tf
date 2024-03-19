resource "aws_instance" "localinst" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    key_name = "testkey"
    tags = {
      Name = "inst-EC2"
    }
  
}

resource "aws_s3_bucket" "buckect" {
  bucket = "bucketsagar"
  depends_on = [ aws_instance.localinst ]
  
}