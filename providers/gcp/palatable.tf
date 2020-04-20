resource "google_storage_bucket" "palatable" {
  name          = "${var.gcp_main_project_id}-${var.gcp_palatable_project_id}"
  project       = var.gcp_main_project_id
  location      = var.gcp_london_region
  storage_class = "REGIONAL"
}
