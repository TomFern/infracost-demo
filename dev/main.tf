provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

# resource "aws_instance" "myserver" {
#   ami           = "ami-674cbc1e"
#   instance_type = "a1.medium"
#   # instance_type = "a1.xlarge"

#   root_block_device {
#     volume_size = 100
#   }

#   ebs_block_device {
#     device_name = "my_data"
#     volume_type = "io1"                     # <<<<< Try changing this to gp2 to compare costs
#     volume_size = 600
#     iops        = 800
#   }
# }


resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda"
  role          = "arn:aws:lambda:us-east-1:account-id:resource-id"
  handler       = "exports.test"
  runtime       = "nodejs12.x"
  memory_size   = 1024
}

