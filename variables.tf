variable "cloud_token" {
  sensitive = true # Requires terraform >= 0.14
}

variable "server_name" {
  default     = "k8s-master"
}

variable "server_type" {
  default     = "cx21"
}

variable "server_location" {
  default   = "nbg1"
}

variable "server_image" {
  default   = "ubuntu-20.04"
}
