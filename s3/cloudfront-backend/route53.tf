resource "aws_route53_record" "www" {
  zone_id = var.route53_zone_id
  name = var.site_domain
  type = "A"

  alias {
    name = aws_cloudfront_distribution.site.domain_name
    zone_id = aws_cloudfront_distribution.site.hosted_zone_id
    evaluate_target_health = false
  }
}
