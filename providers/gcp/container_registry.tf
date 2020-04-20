resource "google_service_account" "mdcurran_container_registry" {
  account_id   = "${var.gcp_main_project_id}-container-registry"
  display_name = "${var.gcp_main_project_id} Container Registry"
  project      = var.gcp_main_project_id
}

resource "google_storage_bucket" "mdcurran_container_registry" {
  name          = var.container_registry_bucket
  project       = var.gcp_main_project_id
  location      = var.gcp_europe_multi_region
  storage_class = "STANDARD"
}
