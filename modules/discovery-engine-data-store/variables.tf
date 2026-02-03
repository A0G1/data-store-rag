variable "project_id" {
  type        = string
  description = "The GCP Project ID where resources will be deployed"
}

variable "data_store_id" {
  type        = string
  description = "The unique ID for the Data Store. Use lowercase letters, numbers, and hyphens only."
}

variable "display_name" {
  type        = string
  description = "The human-readable name of the Data Store shown in the Google Cloud Console."
  default = ""
}

variable "location" {
  type        = string
  default     = "global"
  description = "The geographic location of the Data Store (e.g., 'global', 'us', 'eu')."
}

variable "content_config" {
  type        = string
  default     = "CONTENT_REQUIRED"
  description = "Specifies how content is managed. Options: NO_CONTENT, CONTENT_REQUIRED (for GCS/BigQuery), or PUBLIC_WEBSITE."

  validation {
    condition     = contains(["NO_CONTENT", "CONTENT_REQUIRED", "PUBLIC_WEBSITE"], var.content_config)
    error_message = "The content_config must be one of: NO_CONTENT, CONTENT_REQUIRED, or PUBLIC_WEBSITE."
  }
}