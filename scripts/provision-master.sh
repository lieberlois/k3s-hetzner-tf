# Run updates
apt update -y && apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com | bash

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install K3S
curl -sfL https://get.k3s.io | sh -
mkdir ~/.kube
mv /etc/rancher/k3s/k3s.yaml ~/.kube/config