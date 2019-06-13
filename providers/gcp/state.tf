terraform {
  backend "gcs" {
    bucket = "mdcurran-terraform"
    prefix = "gcp"
  }
}
