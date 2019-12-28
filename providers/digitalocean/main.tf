provider "digitalocean" {
  token = var.api_token
}

resource "digitalocean_project" "mdcurran-kubernetes" {
  name        = var.digitalocean_project_id
  description = "A self-hosted Kubernetes cluster."
  purpose     = "Infrastructure"
  environment = "Development"
}

resource "digitalocean_droplet" "node" {
  name   = var.digitalocean_project_id
  image  = var.droplet_image
  region = var.droplet_region
  size   = var.droplet_size

  monitoring         = true
  private_networking = true
  user_data          = file("bootstrap.sh")
  ssh_keys           = [digitalocean_ssh_key.ssh_key.fingerprint]

  tags = ["k3s", "kubernetes", "single-node"]

  depends_on = [digitalocean_ssh_key.ssh_key]
}

resource "digitalocean_ssh_key" "ssh_key" {
  name       = "mdcurran-ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
