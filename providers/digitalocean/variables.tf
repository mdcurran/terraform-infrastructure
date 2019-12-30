variable "api_token" {
  description = "DigitalOcean API token"
}

variable "digitalocean_project_id" {
  default     = "mdcurran-kubernetes"
  description = "ID of project to deploy resources into"
}

variable "droplet_image" {
  default     = "ubuntu-18-04-x64"
  description = "Image type for deployed Droplets"
}

variable "droplet_region" {
  default     = "lon1"
  description = "Region where Droplets are to be deployed"
}

variable "droplet_size_master" {
  default     = "s-1vcpu-2gb"
  description = "Size for deployed Droplets acting as master nodes"
}

variable "droplet_size_worker" {
  default     = "s-1vcpu-1gb"
  description = "Size for deployed Droplets acting as worker nodes"
}

variable "droplet_generic_tags" {
  type        = list(string)
  default     = ["k3s", "kubernetes"]
  description = "Generic Droplet tags for the Kubernetes cluster"
}
