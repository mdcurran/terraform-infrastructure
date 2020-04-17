# The TF_VAR_api_token environment variable should be set prior to running
# Terraform plan/apply:
#
# export TF_VAR_api_token=<api_token>
provider "digitalocean" {
  token   = var.api_token
  version = "~> 1.16"
}

resource "digitalocean_project" "mdcurran-kubernetes" {
  name        = var.digitalocean_project_id
  description = "A self-hosted Kubernetes cluster."
  purpose     = "Infrastructure"
  environment = "Development"
}

resource "digitalocean_kubernetes_cluster" "mdcurran-kubernetes" {
  name    = var.digitalocean_project_id
  region  = var.cluster_region
  version = var.cluster_version

  node_pool {
    name       = "${var.digitalocean_project_id}-worker-pool"
    size       = var.cluster_worker_size
    node_count = 2
  }
}

output "cluster_id" {
  value = digitalocean_kubernetes_cluster.mdcurran-kubernetes.id
}
