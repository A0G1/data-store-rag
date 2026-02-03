
resource "google_discovery_engine_search_engine" "this" {
  project           = var.project_id
  engine_id         = var.engine_id
  display_name      = "PDF Knowledge Assistant"
  location          = var.location
  collection_id     = "default_collection"
  data_store_ids    = [var.data_store_id]
  industry_vertical = "GENERIC"

  search_engine_config {
    search_tier    = "SEARCH_TIER_ENTERPRISE"
    search_add_ons = ["SEARCH_ADD_ON_LLM"] # Enables RAG capability
  }
}

# Fetch project information to get the project number dynamically
data "google_project" "project" {
  project_id = var.project_id
}

# Grant Vertex AI Service Agent permission to use the EXTERNAL Network Attachment
# We use the name/ID from the variable to target the correct resource
resource "google_project_iam_member" "search_engine_permission" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:service-${data.google_project.project.number}@gcp-sa-discoveryengine.iam.gserviceaccount.com"
}