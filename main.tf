provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source = "./EC2"
  # Add required variables if any
}
