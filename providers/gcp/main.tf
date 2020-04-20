provider "google" {
  version = "~> 2.8"
  project = var.gcp_main_project_id
  region  = var.gcp_london_region
}

resource "google_project" "mdcurran" {
  project_id      = var.gcp_main_project_id
  name            = var.gcp_main_project_id
  billing_account = var.gcp_billing_account_id
  org_id          = var.gcp_org_id
}

resource "google_storage_bucket" "mdcurran-terraform" {
  name          = "${var.gcp_main_project_id}-terraform"
  project       = var.gcp_main_project_id
  location      = var.gcp_london_region
  storage_class = "REGIONAL"
}
