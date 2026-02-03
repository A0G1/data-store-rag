output "search_engine_id" {
  description = "The unique ID of the search engine"
  value       = google_discovery_engine_search_engine.this.engine_id
}

output "search_engine_name" {
  description = "The full resource name (URI) of the search engine"
  value       = google_discovery_engine_search_engine.this.name
}