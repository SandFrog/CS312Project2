terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }

  }

  required_version = ">= 1.2.0"
}
provider "docker" {}
provider "aws" {
  region  = "us-west-2"
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

resource "docker_image" "minecraft_docker" {

  name              = "itzg/minecraft-server"
}
