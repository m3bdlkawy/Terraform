provider "aws" {
    region = "eu-west-3"
}

variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "avail_zone" {}
variable "env_prefix" {}

resource "aws_vpc" "myapp-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
      "name" = "${var.env_prefix}-vpc"
    }
  }
  resource "aws_subnet" "myapp-subnet" {
    vpc_id = aws_vpc.myapp-vpc.id
     cidr_block = var.subnet_cidr_block
     availability_zone = var.avail_zone
      tags = {
      "name" = "${var.env_prefix}-subnet"
    }
    
  }