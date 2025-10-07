variable "tenant_id" {
  type        = string
  description = "The ID of the tenant to deploy resources for"
}

variable "kubeconfig" {
  type = string
  description = "Kubeconfig for the target cluster. To be passed from shared-deploy output."
  sensitive = true
}
