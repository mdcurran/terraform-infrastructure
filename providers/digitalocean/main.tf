# The TF_VAR_api_token environment variable should be set prior to running
# Terraform plan/apply:
#
# export TF_VAR_api_token=<api_token>
provider "digitalocean" {
  token = var.api_token
}

resource "digitalocean_project" "mdcurran-kubernetes" {
  name        = var.digitalocean_project_id
  description = "A self-hosted Kubernetes cluster."
  purpose     = "Infrastructure"
  environment = "Development"
}

resource "digitalocean_ssh_key" "ssh_key" {
  name       = "mdcurran-ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "digitalocean_droplet" "master" {
  name   = "${var.digitalocean_project_id}-master"
  image  = var.droplet_image
  region = var.droplet_region
  size   = var.droplet_size_master

  private_networking = true
  ssh_keys           = [digitalocean_ssh_key.ssh_key.fingerprint]

  tags = concat(var.droplet_generic_tags, ["master"])

  depends_on = [digitalocean_ssh_key.ssh_key]
}

resource "digitalocean_droplet" "worker" {
  # To increase number of worker nodes in the cluster, the for_each array must
  # be manually updated
  for_each = toset(["1", "2"])

  name   = "${var.digitalocean_project_id}-worker-${each.value}"
  image  = var.droplet_image
  region = var.droplet_region
  size   = var.droplet_size_worker

  private_networking = true
  ssh_keys           = [digitalocean_ssh_key.ssh_key.fingerprint]

  tags = concat(var.droplet_generic_tags, ["worker"])

  depends_on = [digitalocean_ssh_key.ssh_key]
}
