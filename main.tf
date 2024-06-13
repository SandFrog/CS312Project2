terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

  }

  required_version = ">= 1.2.0"
}
provider "aws" {
  region  = "us-west-2"
  shared_credentials_files = ["~/.aws/credentials"]
}

resource "aws_security_group" "minecraft_security_group" {
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 25565
    to_port          = 25565
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_key_pair" "public_key" {
  public_key = file("${path.module}/minecraft.pub")
}

resource "aws_instance" "minecraft_server" {
  ami           = "ami-03c983f9003cb9cd1"
  instance_type = "t2.medium"
  key_name 	= aws_key_pair.public_key.key_name
  vpc_security_group_ids = ["${aws_security_group.minecraft_security_group.id}"]
  tags = {
    Name = "MinecraftServerInstance"
  }
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.minecraft_server.public_ip
}


