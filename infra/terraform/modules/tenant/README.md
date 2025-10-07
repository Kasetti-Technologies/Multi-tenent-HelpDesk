# Tenant Module

This module provisions tenant-specific resources, such as namespaces, service accounts, and secrets.

## How to implement

- This module uses the `kubernetes_namespace` and `kubernetes_service_account` resources to create tenant-specific resources.
- It also includes a placeholder for creating a Vault key path for the tenant.

## Inputs

- `tenant_id`: The ID of the tenant to deploy resources for.

## Outputs

- `tenant_namespace`: The name of the tenant's namespace.
- `tenant_service_account`: The name of the tenant's service account.
