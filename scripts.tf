data "template_file" "provision-master" {
  template = "${file("${path.module}/scripts/provision-master.sh")}"
}
