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

  user_data   = "${file("scripts/init.yml")}"

  depends_on  = [hcloud_ssh_key.tf-generated-ssh]
}
