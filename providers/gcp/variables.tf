variable "gcp_main_project_id" {
  default     = "mdcurran"
  description = "ID of the main GCP project"
}

variable "gcp_palatable_project_id" {
  default = "palatable"
  description = "ID of the palatable GCP project"
}

variable "gcp_region" {
  default     = "europe-west2"
  description = "GCP region to deploy resources into"
}

variable "gcp_billing_account_id" {
  default     = "014BA6-A46F18-A5DA40"
  description = "ID for the billing account linked with projects"
}

variable "gcp_org_id" {
  default     = "382911368699"
  description = "The Google Cloud organisation ID to link with"
}
