variable "project_id" {
  type        = string
  description = "The Google Cloud Project ID"
}

variable "location" {
  type        = string
  default     = "global"
  description = "The location for the data store and search engine"
}

variable "data_store_id" {
  type        = string
}

variable "engine_id" {
  type        = string
}