provider "aws" {
  region = var.region
  /*
   access_key = "AKIAYJ3X7MBFMQEEEURD"
   secret_key =  "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"
  */
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
