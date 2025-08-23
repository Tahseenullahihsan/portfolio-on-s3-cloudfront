resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "Access identity for S3 bucket"
}

resource "aws_cloudfront_distribution" "cdn" {
  origin {
   domain_name = "${var.s3_bucket_name}.s3.amazonaws.com"

    origin_id   = "S3-${var.s3_bucket_name}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  default_root_object = var.default_root_object

  default_cache_behavior {
    target_origin_id       = "S3-${var.s3_bucket_name}"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  comment = var.comment
}
