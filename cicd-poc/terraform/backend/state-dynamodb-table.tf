resource "aws_dynamodb_table" "lock" {
  name         = "my-stage-backend-dynamodb-table-123456"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "Terraform State Lock Table"
  }
}
