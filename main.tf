terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.39.0"
    }
  }
}

provider "hcloud" {
  token = var.cloud_token
}


