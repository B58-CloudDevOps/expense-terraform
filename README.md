# expense-terraform

This is the root module which is going to source the remote modules available in "https://github.com/B58-CloudDevOps/tf-module-terraform.git" 

All the terraform init, plan, apply will be executed inside this repository and this is referred as root module and the code from where we are sourcing is referred as backend-module.

All the state information would be supplied in the env-dev or prod and this strategy is to keep the state DRY.