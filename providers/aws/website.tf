resource "aws_s3_bucket" "mdcurran-website-public" {
  bucket        = "mdcurran.com"
  region        = "${var.aws_region}"
  acl           = "private"
  force_destroy = "false"

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "mdcurran-website-public" {
  bucket = "${aws_s3_bucket.mdcurran-website-public.id}"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::mdcurran.com/*"
        }
    ]
}
  POLICY
}

resource "aws_s3_bucket" "mdcurran-website-redirect" {
  bucket        = "www.mdcurran.com"
  region        = "${var.aws_region}"
  acl           = "private"
  force_destroy = "false"

  website {
    redirect_all_requests_to = "mdcurran.com"
  }
}
