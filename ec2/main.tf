provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

resource "aws_instance" "myserver" {
  ami           = "ami-674cbc1e"
  instance_type = "a1.medium"

  root_block_device {
    volume_size = 100
  }
}