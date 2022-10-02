resource "null_resource" "deploy-argocd" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${google_container_cluster.gke-cluster.name} --zone ${var.zone} --project ${var.project_id} && kubectl create ns argocd && kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -n argocd"
  }

  depends_on = [google_container_cluster.gke-cluster]
}
