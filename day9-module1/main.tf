module "dev" {
  source = "../day9-module" # pass github repo link
  ami_id   = "ami-013168dc3850ef002"
  instance_type= "t2.micro"
  key_name  = "devsecopskey"
}