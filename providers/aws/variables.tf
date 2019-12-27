variable "aws_region" {
  default     = "eu-west-2"
  description = "AWS region to deploy resources into"
}

variable "mdcurran_website_domain" {
  default     = "mdcurran.com"
  description = "Base domain name of the static site"
}

locals {
  s3_origin_id = "S3-${var.mdcurran_website_domain}"
}
