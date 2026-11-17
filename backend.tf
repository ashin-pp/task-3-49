terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "task-3-41-tf-state-ashin"
    key            = "task-3-49/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "task-3-41-tf-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}
