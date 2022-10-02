resource "google_service_account" "sa" {
  account_id   = var.sa_account_id
  display_name = "A service account to access GKE Cluster"
}

resource "google_service_account_iam_member" "gke-default-account-iam" {
  service_account_id = google_service_account.sa.name
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${google_service_account.sa.email}"
}
