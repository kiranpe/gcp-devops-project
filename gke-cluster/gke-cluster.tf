locals {
  labels = {
    component = "dev-cluster"
    env       = "dev"
  }

  tags = ["env", "dev"]
}

resource "google_container_cluster" "gke-cluster" {
  name               = var.gke_cluster_name
  location           = var.zone
  initial_node_count = 2
  node_config {
    service_account = google_service_account.sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = local.labels
    tags   = local.tags
  }
  timeouts {
    create = "30m"
    update = "40m"
  }
}
