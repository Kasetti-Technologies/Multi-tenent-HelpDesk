# Per-tenant overlay: instantiate tenant module per tenant and provision tenant-scoped resources.
terraform {
  required_version = ">= 1.0"
}

variable "tenants" {
  type = list(string)
  default = ["tenant-a"] # replace with real tenant list or external data source
}

variable "image_tag" {
  type = string
  default = "v0.1.0"
}

# Example loop to create per-tenant overlay modules
locals {
  tenant_list = var.tenants
}

# For each tenant instantiate the tenant module
module "tenant_overlays" {
  for_each = toset(local.tenant_list)
  source   = "./modules/tenant"
  tenant_id = each.key
  image_tag = var.image_tag
  resources = { cpu = "500m", memory = "512Mi" }  # example defaults
}

# Optionally: create per-tenant Vault key paths for BYOK
# (Implementation uses Vault provider or external script to create secret/data/tenant/{tenant_id}/keys)
# Example (pseudo):
# resource "vault_generic_secret" "tenant_keys" {
#   for_each = toset(local.tenant_list)
#   path = "secret/data/tenant/${each.key}/keys"
#   data_json = jsonencode({ key_metadata = "placeholder" })
# }
