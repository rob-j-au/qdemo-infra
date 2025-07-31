# Qdemo Infrastrucure

#### Endpoint

[https://qdemo.k8s.aws.jennings.au](https://qdemo.k8s.aws.jennings.au)


### EKS

`terraform/eks.tf`

#### Kubeconfig

`aws eks update-kubeconfig --name demo`

#### NGINX Ingress

[https://kubernetes.github.io/ingress-nginx/deploy/#aws](https://kubernetes.github.io/ingress-nginx/deploy/#aws)

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.13.0/deploy/static/provider/aws/deploy.yaml
```

Tag subnets for LoadBalancer

```
kubernetes.io/cluster/demo     shared
kubernetes.io/role/elb           1         
```


#### cert-manager

[https://cert-manager.io](https://cert-manager.io)

```
helm repo add jetstack https://charts.jetstack.io --force-update

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.18.2 \
  --set crds.enabled=true
```

Production ClusterIssuer

```
kubectl apply -f kubernetes/cert-manager/clusterissuer-prod.yaml
```

### Helm app

```
cd kubernetes/helm

# install
helm install qdemo ./qdemo-app

# upgrade
helm upgrade qdemo ./qdemo-app
```

Helm Values

```
image:
  repository: robjau/qdemo
```

```
ingress:
 annotations:
   kubernetes.io/ingress.class: nginx
   kubernetes.io/tls-acme: "true"
   cert-manager.io/cluster-issuer: "letsencrypt-prod"

...
...

 hosts:
   - host: qdemo.k8s.aws.jennings.au
     paths:
       - path: /
         pathType: ImplementationSpecific
 tls:
   - secretName: qdemo-app-tls
     hosts:
       - qdemo.k8s.aws.jennings.au
```

### DNS Setup

```
aws.jennings.au Cloudflare NS delegation to AWS Route53 Zone

*.k8s.aws.jennings.au Route53 Wildcard Alias record pointing to NGINX Ingress LoadBalancer's NLB
```

Given extra time the Route53 record would be in Terraform