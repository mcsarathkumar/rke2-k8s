helm upgrade rke2-ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace kube-system --set controller.metrics.enabled=true --set-string controller.podAnnotations."prometheus\.io/scrape"="true" --set-string controller.podAnnotations."prometheus\.io/port"="10254"

helm get values rke2-ingress-nginx --namespace kube-system

kubectl apply --kustomize ./prometheus/
kubectl apply --kustomize ./grafana/
