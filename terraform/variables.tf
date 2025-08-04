variable "region" {
  type = string
}

variable "zone_domain_name" {
  type = string
}

variable "eks_cluster_name" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "nginx_ingress_nlb_endpoint" {
  type = string
}

variable "nginx_ingress_nlb_zone_id" {
  type = string
}