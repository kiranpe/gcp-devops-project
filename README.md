# gcp-devops-project

GKE Cluster:
------------
--> I am using gke cluster to deploy my docker image.

--> I have added terraform code to create GKE cluster, install ArgoCD on top of it and state bucket to store terraform state file in remote location.

--> Imp: Run "gcloud auth application-default login" to set up logins.

--> First create state bucket. 
    
    Commands:
          cd state_bucket/
          Run init: terraform init
          Run plan: terraform plan -var-file=values.tfvars
          Run apply to create stack: terraform apply -auto-approve -var-file=values.tfvars
          Run destroy to delete stack: terraform destroy -auto-approve -var-file=values.tfvars

--> Now create GKE Cluster

    Commands:
          cd gke-cluster/
          Run init to intialize backend: terraform init -backend-config=backend.config
          Run plan: terraform plan -var-file=values.tfvars
          Run apply to create stack: terraform apply -auto-approve -var-file=values.tfvars
          Run destroy to delete stack: terraform destroy -auto-approve -var-file=values.tfvars 
  
          Command To get ArgoCD Secret:
             kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

    As I said earilier, this will create GKE custer and Argo CD. 
  
    V.Imp Note: Please edit argocd-server service file and change it to "Loadbalancer" to access UI using Loadbalcer IP!!

Argo CD Deployment:
------------------

--> Once you are done with cluster creation, deploy nginx application.

    Commands:
          cd argocd/
          kubectl apply -f gcp-application.yaml

    This will deploy a simple webapp. you can access it by using your loadbalancer IP.
    Url: http://<LoadBalancer IP/EXTERNAL IP>:8080/studentsinfo

    Note: Remove your webapp application first in GKE Cluster and then destroy cluster!!

    Command: kubectl delete -f gcp-application.yaml
