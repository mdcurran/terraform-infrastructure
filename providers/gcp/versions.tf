terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.11"
    }
  }
  required_version = ">= 1.1.6"
}
