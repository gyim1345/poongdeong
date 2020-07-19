resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = "${aws_s3_bucket.resource-bucket.website_endpoint}"
    origin_id   = "S3-Website-${aws_s3_bucket.resource-bucket.website_endpoint}"

    custom_origin_config {
      http_port = 80
      https_port = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols = ["TLSv1.1"]
    }
  }

  aliases = [local.resourceBucket]
  viewer_certificate {
    acm_certificate_arn = local.resource_acm_arn
    ssl_support_method  = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  tags = local.tags

  enabled         = true
  is_ipv6_enabled = true

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-Website-${aws_s3_bucket.resource-bucket.website_endpoint}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    max_ttl                = 31536000
    default_ttl            = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

resource "aws_cloudfront_distribution" "web_cdn" {
  origin {
    domain_name = "${aws_s3_bucket.bucket.website_endpoint}"
    origin_id   = "S3-Website-${aws_s3_bucket.bucket.website_endpoint}"

    custom_origin_config {
      http_port = 80
      https_port = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols = ["TLSv1.1"]
    }
  }

  aliases = [local.bucket]
  viewer_certificate {
    acm_certificate_arn = local.web_acm_arn
    ssl_support_method  = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  tags = local.tags

  enabled         = true
  is_ipv6_enabled = true

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-Website-${aws_s3_bucket.bucket.website_endpoint}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    max_ttl                = 31536000
    default_ttl            = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

resource "aws_cloudfront_distribution" "redircet_cdn" {
  origin {
    domain_name = "${aws_s3_bucket.redirect_bucket.website_endpoint}"
    origin_id   = "S3-Website-${aws_s3_bucket.redirect_bucket.website_endpoint}"

    custom_origin_config {
      http_port = 80
      https_port = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols = ["TLSv1.1"]
    }
  }

  aliases = [local.redirectBucket]
  viewer_certificate {
    acm_certificate_arn = local.web_acm_arn
    ssl_support_method  = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  tags = local.tags

  enabled         = true
  is_ipv6_enabled = true

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-Website-${aws_s3_bucket.redirect_bucket.website_endpoint}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    max_ttl                = 31536000
    default_ttl            = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
