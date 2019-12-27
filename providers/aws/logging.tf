resource "aws_s3_bucket" "mdcurran-logs" {
  bucket        = "mdcurran-logs"
  region        = var.aws_region
  acl           = "private"
  force_destroy = "false"
}
