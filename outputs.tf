output "k8s-master-ipv4" {
  value = "ssh root@${hcloud_server.k8s-master.ipv4_address}"
}

output "scp-kubeconfig" {
  value = "scp root@${hcloud_server.k8s-master.ipv4_address}:~/.kube/config ~/.kube/config && sed -i 's/127.0.0.1/${hcloud_server.k8s-master.ipv4_address}/g' ~/.kube/config"
}
