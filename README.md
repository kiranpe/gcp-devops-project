# gcp-devops-project

GKE Cluster:
------------
--> I am using gke cluster to deploy my docker image.

--> I have added terraform code to create GKE cluster, install ArgoCD on top of it and state bucket to store terraform state file in remote location.

--> Imp: Run "gcloud auth application-default login" to set up logins.

--> First create state bucket. 
    
    Commands:
          cd state_bucket/
          terraform init
          run plan: terraform plan -var-file=values.tfvars
          apply to create stack: terraform apply -auto-approve -var-file=values.tfvars
          run destroy to delete stack: terraform destroy -auto-approve -var-file=values.tfvars
