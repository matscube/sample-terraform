locals {
  s3_origin_id = "s3-origin-${var.site_domain}"
}

resource "aws_cloudfront_origin_access_identity" "site" {
  comment = var.site_domain
}

resource "aws_cloudfront_distribution" "site" {
  origin {

    domain_name = aws_s3_bucket.site.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.site.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = var.site_domain
  default_root_object = "index.html"

  // todo: loggin
  # logging_config {
  #   include_cookies = false
  #   bucket          = "mylogs.s3.amazonaws.com"
  #   prefix          = "myprefix"
  # }
  
  aliases = [var.site_domain]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

    # (Optional) Set basic authentication
    lambda_function_association {
      event_type   = "viewer-request"
      lambda_arn   = module.basic_auth.lambda_arn
      include_body = false
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # asia/us
  price_class = "PriceClass_200"

  # use cloudfront domain as site url
  # viewer_certificate {
  #   cloudfront_default_certificate = true
  # }
  viewer_certificate {
    # use new certificate
    # acm_certificate_arn = "${aws_acm_certificate_validation.acm_cert.certificate_arn}"

    # use existing certificate
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1"
  }
}