resource "aws_s3_bucket" "buckets3" {
  bucket = "bucket-statefile"
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-statelock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}