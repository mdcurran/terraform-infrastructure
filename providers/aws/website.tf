resource "aws_s3_bucket" "mdcurran-website-public" {
  bucket        = "${var.mdcurran_website_domain}"
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
            "Resource": "arn:aws:s3:::${var.mdcurran_website_domain}/*"
        }
    ]
}
  POLICY

  depends_on = [
    "aws_s3_bucket.mdcurran-website-public"
  ]
}

resource "aws_s3_bucket" "mdcurran-website-redirect" {
  bucket        = "www.${var.mdcurran_website_domain}"
  region        = "${var.aws_region}"
  acl           = "private"
  force_destroy = "false"

  website {
    redirect_all_requests_to = "${var.mdcurran_website_domain}"
  }
}

locals {
  s3_origin_id = "S3-${var.mdcurran_website_domain}"
}

resource "aws_cloudfront_distribution" "mdcurran-website-distribution" {
  origin {
    domain_name = "${aws_s3_bucket.mdcurran-website-public.bucket_regional_domain_name}"
    origin_id   = "${local.s3_origin_id}"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for ${var.mdcurran_website_domain}"
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = "${aws_s3_bucket.mdcurran-logs.bucket_domain_name}"
    prefix          = "mdcurran.com/"
  }

  aliases = ["${var.mdcurran_website_domain}", "www.${var.mdcurran_website_domain}"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${local.s3_origin_id}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = "arn:aws:acm:us-east-1:079785868694:certificate/86b6c42d-8ed6-4605-a75e-94e27340790e"
    minimum_protocol_version = "TLSv1.1_2016"
    ssl_support_method       = "sni-only"
  }

  depends_on = [
    "aws_s3_bucket.mdcurran-logs",
    "aws_s3_bucket.mdcurran-website-public",
    "aws_s3_bucket.mdcurran-website-redirect",
  ]
}
