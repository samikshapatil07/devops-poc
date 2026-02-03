# Security Group to allow SSH (22) and HTTP (80)
resource "aws_security_group" "this" {
  name        = "${var.environment}-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  # Allow incoming SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow incoming HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]
  key_name               = var.key_name

  # Install Docker on startup
  user_data = <<-EOF
              #!/bin/bash
              # Update the system
              yum update -y
              
              # Install Docker
              amazon-linux-extras install docker -y
              
              # Start Docker service
              service docker start
              
              # Add the ec2-user to the docker group so you can execute Docker commands without sudo
              usermod -a -G docker ec2-user
              
              # Enable Docker to start on boot
              chkconfig docker on
              EOF

  tags = {
    Name = "${var.environment}-server"
  }
}
