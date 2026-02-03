resource "google_discovery_engine_data_store" "this" {
  project           = var.project_id
  location          = var.location
  data_store_id     = var.data_store_id
  display_name      = var.display_name
  industry_vertical = "GENERIC"
  content_config    = var.content_config
  solution_types    = ["SOLUTION_TYPE_SEARCH"]


  # Standard chunking for RAG
  document_processing_config {
    default_parsing_config {
      digital_parsing_config {}
    }
    // RAG Chuning config
    chunking_config {
      layout_based_chunking_config {
        chunk_size           = 500  
        include_ancestor_headings = true
      }
    }
  }
}

