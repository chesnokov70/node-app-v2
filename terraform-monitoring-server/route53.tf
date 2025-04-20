resource "aws_route53_record" "monitoring" {
  zone_id = "Z02513281LW30MJHRYZB" # Your Route 53 zone ID
  name    = "monitoring.ches-it.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.monitoring.public_ip]
}
