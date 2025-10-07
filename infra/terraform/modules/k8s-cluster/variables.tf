variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to deploy to"
}

variable "gcp_region" {
  type        = string
  description = "The GCP region to deploy to"
}

variable "cluster_size" {
  type        = string
  description = "Size of the cluster (e.g., small, medium, large)"
  default     = "medium"
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to the cluster resources."
  default = {}
}
