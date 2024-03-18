terraform {
  backend "s3" {
    bucket = "bucket-statefile"
    key    = "terraform.tfstate"   # key name is file name
    region = "ap-south-1"
    dynamodb_table = "terraform-statelock-dynamo" # DynamoDB table used for state locking, note: first run day-4-statefile-s3
    encrypt        = true  # Ensures the state is encrypted at rest in S3

  }
}