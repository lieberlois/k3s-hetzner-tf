resource "hcloud_ssh_key" "tf-generated-ssh" {
  name       = "tf-generated-ssh"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "hcloud_server" "k8s-master" {
  name        = var.server_name
  image       = var.server_image
  server_type = var.server_type
  location    = var.server_location
  ssh_keys    = tolist([hcloud_ssh_key.tf-generated-ssh.name])

  provisioner "remote-exec" {

    connection {
      type        = "ssh"
      user        = "root"
      private_key = "${file("~/.ssh/id_rsa")}"
      host        = "${self.ipv4_address}"
    }

    inline = [
      "apt update -y && apt upgrade -y",
      "curl -fsSL https://get.docker.com | bash",
      "curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash",
      "curl -sfL https://get.k3s.io | sh -",
      "mkdir ~/.kube && mv /etc/rancher/k3s/k3s.yaml ~/.kube/config"
    ]

  }


  depends_on  = [hcloud_ssh_key.tf-generated-ssh]
}
