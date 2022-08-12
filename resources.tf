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

  user_data   = "${file("scripts/init.yml")}"

  depends_on  = [hcloud_ssh_key.tf-generated-ssh]
}
