variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to deploy to"
}

variable "gcp_region" {
  type        = string
  description = "The GCP region to deploy to"
}

variable "db_password" {
  type        = string
  description = "The password for the PostgreSQL database"
  sensitive   = true
}
