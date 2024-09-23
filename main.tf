provider "aws" {
  region = "us-east-1"  # Change as needed
}

resource "aws_security_group" "allow_3002" {
  name        = "allow_3002"
  description = "Allow inbound traffic on port 3002"

  ingress {
    from_port   = 3002
    to_port     = 3002
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Change as needed for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "t2_micro" {
  ami           = "ami-0c55b159cbfafe1f0"  # Change to the latest AMI ID
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_3002.name]

  tags = {
    Name = "T2 Micro Instance"
  }
}

resource "aws_instance" "t2_medium" {
  ami           = "ami-0c55b159cbfafe1f0"  # Change to the latest AMI ID
  instance_type = "t2.medium"

  tags = {
    Name = "T2 Medium Instance"
  }
}
