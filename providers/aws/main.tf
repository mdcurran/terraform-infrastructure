provider "aws" {
  version                 = "~> 2.13"
  region                  = "${var.aws_region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terraform"
}

resource "aws_s3_bucket" "mdcurran" {
  bucket        = "mdcurran"
  region        = "${var.aws_region}"
  acl           = "private"
  force_destroy = "false"
}

resource "null_resource" "example" {}
