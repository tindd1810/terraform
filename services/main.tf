terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
  backend "s3" {
    bucket = "tindd-terraform-state-pro"
    key = "services/terraform.tfstate"
    region = "ap-southeast-1"
  }
  
}

provider "aws" {
  region = "ap-southeast-1"
}

module "services" {
  source = "git@github.com:tindd1810/modules.git//services"
  #source = "../../terraform-module/services"
  #isCreated = 1
}