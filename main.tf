terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket = "zevopstest"
    key = "terraform"
    region = "us-east-1"
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-051dfed8f67f095f5"
  instance_type = "t2.nano"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
