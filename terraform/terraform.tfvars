region                     = "ap-southeast-2"
eks_cluster_name           = "demo"
subnets                    = ["subnet-0bc925b7863aace8b", "subnet-0f7a41fc97d941492", "subnet-01e551646c1d34cb6"]
vpc_id                     = "vpc-00c11265ea412bd42"
zone_domain_name           = "aws.jennings.au"
nginx_ingress_nlb_endpoint = "k8s-ingressn-ingressn-644f65aebb-14b9ae32e9a336e0.elb.ap-southeast-2.amazonaws.com"
nginx_ingress_nlb_zone_id  = "ZCT6FZBF4DROD" # ap-southeast-2 NLB Hosted Zone ID