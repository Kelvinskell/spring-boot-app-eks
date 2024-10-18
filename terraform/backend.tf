terraform {
  # Change this to your own remote backend or just use a local backend.
  backend "s3" {
    bucket         = "bh-spring-boot-app-infra-eks"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "bh-spring-boot-app-infra-table-eks"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.20.0"
    }
  }
}

provider "aws" {
  region  = var.region
}
