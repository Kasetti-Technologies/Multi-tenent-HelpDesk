output "tenant_namespace" {
  value = kubernetes_namespace.tenant_namespace.metadata[0].name
}

output "tenant_service_account" {
  value = kubernetes_service_account.tenant_service_account.metadata[0].name
}
