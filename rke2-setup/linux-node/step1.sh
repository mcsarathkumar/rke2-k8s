# Install RKE2
curl -sfL https://get.rke2.io | INSTALL_RKE2_TYPE="agent" sh

# Config Services
systemctl enable rke2-agent.service

# Configure RKE2
mkdir -p /etc/rancher/rke2
echo Edit config.yaml with values from server RKE2, and execute step2.sh
