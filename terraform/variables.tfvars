credentials_file = "[PATH_CREDENTIAL_FILE/CREDENTIAL_FILE.json]"
project          = "[PROJECT_ID]"
region           = "europe-west"
// appengine-region = "europe-west"
// zone = "europe-west2-a"
gcp_service_list = [
  "cloudresourcemanager.googleapis.com",
  "iam.googleapis.com",
  "cloudfunctions.googleapis.com",
  "appengine.googleapis.com"
]
pubsub_topic_list = [
  "balance",
  "transactions"
]