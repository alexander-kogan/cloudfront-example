//Add Root Route53 Records
resource "aws_route53_record" "main_record" {
  zone_id = "${var.hosted_zone_id}"
  name = "${var.route53_record_name}.${var.domain_name}"
  type = "A"

  alias {
    name = "${aws_cloudfront_distribution.cloudfront_distribution.domain_name}"
    zone_id = "${var.alias_zone_id}"
    evaluate_target_health = false
  }
}
