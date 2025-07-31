resource "aws_route53_zone" "main" {
  name = var.zone_domain_name
}

output "zone_id" {
  value = aws_route53_zone.main.zone_id
}

output "name_servers" {
  value = aws_route53_zone.main.name_servers
}