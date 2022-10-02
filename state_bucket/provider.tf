terraform {
  required_providers {
    google = {
      version = "4.38.0"
      source  = "hashicorp/google"
    }

    null = {
      version = "3.1.1"
      source  = "hashicorp/null"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
