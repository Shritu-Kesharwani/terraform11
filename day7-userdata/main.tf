resource "aws_instance" "web" {
  ami                    = "ami-013168dc3850ef002"     # change ami id for different region
  instance_type          = "t2.micro"
  key_name               = "testkey"                    # change key name as per your setup
  user_data              = file("test.sh")              # define your path and file name 
     
  tags = {
    Name = "project-MainEc2"
  }
}