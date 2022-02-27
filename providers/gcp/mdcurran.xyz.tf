resource "google_storage_bucket" "mdcurran_xyz" {
  name          = var.mdcurran_website_domain
  project       = var.gcp_main_project_id
  location      = var.gcp_london_region
  storage_class = "REGIONAL"

  uniform_bucket_level_access = false

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_default_object_acl" "public_rule" {
  bucket      = google_storage_bucket.mdcurran_xyz.name
  role_entity = ["READER:allUsers"]

  depends_on = [
    google_storage_bucket.mdcurran_xyz,
  ]
}
