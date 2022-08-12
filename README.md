# Terraform setup for provisioning a lightweight single node K3S cluster on Hetzner Cloud

This terraform setup allows for easy provisioning of a preconfigured K3S cluster which aims to minimize
the time to get started with a testing cluster. This cluster is obviously not production ready but just
intended for testing and learning purposes.

## Setup

In order to setup the cluster, you need:
- Hetzner Cloud Project with an API key (read/write)
- Terraform

Generate a file `terraform.tfvars`. You can find a template wihtin `example.terraform.tfvars`. Insert your API key here. Now run the following commands:

```sh
terraform init
terraform apply
```

By default, this provisions a CX21 instance on Hetzner with a preconfigured K3S cluster. To further configure the provisioned instance, check `variables.tf` 
to see the other Terraform variables that are being used within `resources.tf`. To gain access to the provisioned cluster, use the command `terraform output` to see
commands to 1) connect to the provisioned instance using SSH or 2) copy the kubeconfig file to your host machine using SCP.
