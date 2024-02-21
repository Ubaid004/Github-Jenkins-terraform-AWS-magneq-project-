
terraform {
	required_providers{
	aws= {
	source = "hashicorp/aws"
	version = ">= 2.13.0"
	}
}
required_version = ">= 1.2.0"
}

provider "aws"{
	region= "ap-south-1a"
}

resource "aws_instance" "zoro"{

	ami = "ami-0a7cf821b91bcccbc"
	instance_type = "t2.micro"
	vpc_security_group_ids = [aws_security_group.zoro.id]
	key_name = "zoro"
	availability_zone = "ap-south-1a"
	user_data = <<EOF
#!/bin/bash
sudo -i
apt install httpd
systemctl start httpds
chkconfig httpd on 
echo "Hai all, Zoro here - website created by terraform infrastructure on Zoro-server" > /var/www/html/index.html
	
EOF
	tags = {
		Name = "web-Zoro"
}
}


resource "aws_instance" "nami" {
	ami = "ami-0a7cf821b91bcccbc"
	instance_type   = "t2.micro"
	key_name        = "zoro"
	vpc_security_group_ids = [aws_security_group.zoro.id]
	availability_zone = "ap-south-1b"
	user_data       = <<EOF
#!/bin/bash
sudo -i
apt install httpd 
systemctl start httpd
chkconfig httpd on
echo "Hai all Nami here- website created by terraform infrastructure on Nami-server" > /var/www/html/index.html
EOF
	tags = {
		Name = "web-nami"
  }
}



resource "aws_security_group" "zoro" {
	name = "elb-sg"
	ingress {
		from_port   = 22
    		to_port     = 22
    		protocol    = "tcp"
    		cidr_blocks = ["0.0.0.0/0"]
  }
  	ingress {
    		from_port   = 80
    		to_port     = 80
    		protocol    = "tcp"
    		cidr_blocks = ["0.0.0.0/0"]
  }

  	egress {
    		from_port   = 0
    		to_port     = 0
    		protocol    = "-1"
    		cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_iam_user" "zoro-user" {
	for_each = var.user_names
	name = each.value
}

variable "user_names" {
	description = "*"
	type = set(string)
	default = ["zoro", "nami"]
}

resource "aws_ebs_volume" "zoro-ebs" {
	availability_zone = "ap-south-1a"
	size = 10
  	tags = {
    		Name = "ebs-zoro"
  	}
}
