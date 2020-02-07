help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: 
	terraform init

fmt:
	terraform fmt

plan:
	terraform plan -var-file="variables.tfvars"

apply:
	terraform apply -var-file="variables.tfvars" --auto-approve

destroy:
	terraform destroy -var-file="variables.tfvars"
