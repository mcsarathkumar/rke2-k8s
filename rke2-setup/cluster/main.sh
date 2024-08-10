# Install RKE2
curl -sfL https://get.rke2.io | sh

# Configure RKE2
mkdir -p /etc/rancher/rke2
cp ./config.yaml /etc/rancher/rke2/config.yaml

# Start Services
systemctl enable rke2-server.service
systemctl start rke2-server.service

echo $PATH

# Set Environment Variables
echo PATH="$PATH:/var/lib/rancher/rke2/bin/" > /etc/environment
echo KUBECONFIG=/etc/rancher/rke2/rke2.yaml >> /etc/environment

source /etc/environment

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Node Config yaml
PUBLIC_IP=$(curl -s ifconfig.me)
#PUBLIC_IP="10.93.15.19"
NODE_TOKEN=$(cat /var/lib/rancher/rke2/server/node-token)
echo server: https://$PUBLIC_IP:9345 > node-config.yaml
echo token: $NODE_TOKEN >> node-config.yaml
