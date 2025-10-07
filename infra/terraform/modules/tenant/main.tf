# Create a namespace for the tenant
resource "kubernetes_namespace" "tenant_namespace" {
  metadata {
    name = "tenant-${var.tenant_id}"
  }
}

# Create a service account for the tenant
resource "kubernetes_service_account" "tenant_service_account" {
  metadata {
    name      = "tenant-${var.tenant_id}-sa"
    namespace = kubernetes_namespace.tenant_namespace.metadata[0].name
  }
}

# Placeholder for creating a Vault key path for the tenant
# resource "vault_generic_secret" "tenant_secrets" {
#   path = "kv/tenants/${var.tenant_id}"
#   data_json = jsonencode({
#     "api_key" = "..."
#   })
# }
