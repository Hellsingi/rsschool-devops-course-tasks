terraform {
  backend "s3" {
    bucket  = "rsschooldevops1991"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}

provider "aws" {
  region  = "eu-west-1"
  profile = "rs-school-user"
}


resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [
    "74F3A68F16524F15424927704C9506F55A9316BD", # Ensure this thumbprint is correct
  ]

  tags = {
    Name = "GitHub OIDC Provider"
  }
}
