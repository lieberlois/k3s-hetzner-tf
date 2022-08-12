output "k8s-master-ipv4" {
  value = "${hcloud_server.k8s-master.ipv4_address}"
}
