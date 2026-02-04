module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name
  environment = var.environment
}

module "network" {
  source      = "../../modules/network"
  environment = var.environment
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

module "ec2" {
  source        = "../../modules/ec2"
  environment   = var.environment
  vpc_id        = module.network.vpc_id
  subnet_id     = module.network.subnet_id
  instance_type = "t3.micro"
  ami_id        = "ami-0cff7528ff583bf9a" # Amazon Linux 2 (us-east-1)
  key_name      = var.key_name
}
