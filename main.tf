terraform {
  backend "s3" {
    bucket  = "rsschooldevops1991"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}

provider "aws" {
  region = "eu-west-1"
}


resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [
    "6938FD4D98BAB03FAADB97B34396831E3780AEA1", # Ensure this thumbprint is correct
  ]

  tags = {
    Name = "GitHub OIDC Provider"
  }
}
