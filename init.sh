terraform init -backend-config=env-${ENV}/state.tfvars
terraform plan -var-file=env-${ENV}/main.tfvars -var vault_token=${vault_token}
terraform apply -auto-approve -var-file=env-${ENV}/main.tfvars -var vault_token=${vault_token}