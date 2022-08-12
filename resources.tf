resource "hcloud_ssh_key" "tf-generated-ssh" {
  name       = "tf-generated-ssh"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "hcloud_server" "k8s-master" {
  name        = "k8s-master"
  image       = "ubuntu-20.04"
  server_type = "cx21"
  location    = "nbg1"
  ssh_keys    = tolist([hcloud_ssh_key.tf-generated-ssh.name])

  user_data   = <<-EOF
    # Run updates
    apt update -y && apt upgrade -y

    # # Install Docker
    curl -fsSL https://get.docker.com | bash

    # Install Helm
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

    # Install K3S
    curl -sfL https://get.k3s.io | sh -
    mkdir ~/.kube
    mv /etc/rancher/k3s/k3s.yaml ~/.kube/config
  EOF

  depends_on  = [hcloud_ssh_key.tf-generated-ssh]
}
