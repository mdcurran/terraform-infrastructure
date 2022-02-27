variable "gcp_main_project_id" {
  default     = "mdcurran"
  description = "ID of the main GCP project"
}

variable "gcp_europe_multi_region" {
  default     = "eu"
  description = "Identifier for the European multi-region"
}

variable "gcp_london_region" {
  default     = "europe-west2"
  description = "Identifier for the London region"
}

variable "container_registry_bucket" {
  default     = "eu.artifacts.mdcurran.appspot.com"
  description = "Name of the auto-generated container registry bucket"
}

variable "gcp_billing_account_id" {
  default     = "014BA6-A46F18-A5DA40"
  description = "ID for the billing account linked with projects"
}

variable "gcp_org_id" {
  default     = "382911368699"
  description = "The Google Cloud organisation ID to link with"
}

variable "mdcurran_website_domain" {
  default     = "mdcurran.xyz"
  description = "Personal website domain"
}
