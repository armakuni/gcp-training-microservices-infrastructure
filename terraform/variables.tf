variable "credentials_file" {}

variable "project" {}

variable "region" {
  default = "europe-west2"
}

variable "zone" {}

variable "gcp_service_list" {
  description = "List of GCP service to be enabled for a project."
  type        = list
}
