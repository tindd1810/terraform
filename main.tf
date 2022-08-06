terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
  backend "s3" {
    bucket = "tindd-terraform-state-dev"
    key = "services/terraform.tfstate"
    region = "ap-southeast-1"
  }
  
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "tindd-server" {
  count = 2
  ami           = "ami-02248c9d6ba0b9e12"
  instance_type = "t2.micro"
  #key_name = "tindd"
  #user_data = file("userdata.sh")
  #vpc_security_group_ids = [data.terraform_remote_state.networking.outputs.sg-id]
  tags = {
    Name = "tindd-ec2"
  }
}