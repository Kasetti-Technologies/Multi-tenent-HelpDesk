variable "gcp_region" {
  type        = string
  description = "The GCP region to deploy to"
}

variable "db_password" {
  type        = string
  description = "The password for the database"
  sensitive   = true
}
