# Per-tenant deploy: provision tenant-specific resources (e.g., namespace, service accounts, secrets).
terraform {
  required_version = ">= 1.0"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.20.0"
    }
    vault = {
      source = "hashicorp/vault"
      version = ">= 3.16.0"
    }
  }
}

# Assumes kubernetes provider is configured by the calling environment (e.g. CI/CD)
# with credentials for the target cluster.

# Variables
variable "tenant_id" {
  type        = string
  description = "The ID of the tenant to deploy resources for"
}

variable "kubeconfig" {
  type = string
  description = "Kubeconfig for the target cluster. To be passed from shared-deploy output."
  sensitive = true
}

# Per-tenant Modules
module "tenant" {
  source    = "./modules/tenant"
  tenant_id = var.tenant_id
  kubeconfig = var.kubeconfig
}
