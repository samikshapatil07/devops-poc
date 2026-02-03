terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "my-stage-backend-bucket-123456"
    key            = "envs/stage/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-stage-backend-dynamodb-table-123456"
    encrypt        = true
  }
}



provider "aws" {
  region = var.region
}
