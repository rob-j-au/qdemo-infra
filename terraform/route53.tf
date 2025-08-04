resource "aws_route53_zone" "main" {
  name = var.zone_domain_name
}

resource "aws_route53_record" "k8s_aws_wildcard" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "*.k8s.aws.jennings.au"
  type    = "A"
  alias {
    name                   = var.nginx_ingress_nlb_endpoint
    zone_id                = var.nginx_ingress_nlb_zone_id
    evaluate_target_health = true
  }

} 
output "zone_id" {
  value = aws_route53_zone.main.zone_id
}

output "name_servers" {
  value = aws_route53_zone.main.name_servers
}

