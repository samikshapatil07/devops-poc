variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "key_name" {
  description = "Name of the AWS Key Pair"
  type        = string
}
