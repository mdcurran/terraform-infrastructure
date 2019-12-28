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

variable "droplet_size" {
  default     = "s-1vcpu-2gb"
  description = "Size for deployed Droplets"
}
