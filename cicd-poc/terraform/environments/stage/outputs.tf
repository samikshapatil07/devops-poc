output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_ip" {
  value = module.ec2.public_ip
}
