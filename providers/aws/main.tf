provider "aws" {
  version                 = "~> 2.13"
  region                  = "${var.aws_region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terraform"
}
