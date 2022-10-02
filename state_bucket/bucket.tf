resource "google_storage_bucket" "state_bucket" {
  name          = "${var.project_id}-tf-state"
  location      = var.region
  force_destroy = true
}
