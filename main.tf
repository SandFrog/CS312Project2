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
    from_port        = 25565
    to_port          = 25565
    protocol         = "tcp"
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
}


resource "aws_instance" "minecraft_server" {
  ami           = "ami-03c983f9003cb9cd1"
  instance_type = "t2.medium"
  vpc_security_group_ids = ["${aws_security_group.minecraft_security_group.id}"]

  tags = {
    Name = var.instance_name
  }
}

