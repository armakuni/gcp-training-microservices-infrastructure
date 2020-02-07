resource "null_resource" "firestore-instance" {
  provisioner "local-exec" {
    command     = "gcloud builds submit ../../gcp-training-customer-service --config="../../gcp-training-customer-service/cloudbuild.yaml""
    interpreter = ["/bin/bash", "-c"]
  }
}

resource "null_resource" "firestore-instance" {
  provisioner "local-exec" {
    command     = "gcloud builds submit ../../gcp-training-account-service --config="../../gcp-training-account-service/cloudbuild.yaml""
    interpreter = ["/bin/bash", "-c"]
  }
}