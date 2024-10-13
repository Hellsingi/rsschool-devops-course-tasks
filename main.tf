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
