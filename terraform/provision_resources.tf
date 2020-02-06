resource "google_app_engine_application" "app-engine" {
  project     = var.project
  location_id = var.region

  depends_on = [
    google_project_service.gcp_services
  ]
}