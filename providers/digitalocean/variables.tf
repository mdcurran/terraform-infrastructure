variable "api_token" {
  description = "DigitalOcean API token"
}

variable "digitalocean_project_id" {
  default     = "mdcurran-kubernetes"
  description = "ID of project to deploy resources into"
}

variable "cluster_version" {
  default     = "1.16.6-do.2"
  description = "DigitalOcean Kubernetes cluster version"
}

variable "cluster_region" {
  default     = "lon1"
  description = "Region where cluster is deployed"
}

variable "cluster_worker_size" {
  default     = "s-1vcpu-2gb"
  description = "Size of the cluster worker nodes"
}
