# Tenant-Deploy Environment

This environment provisions tenant-specific resources, including:

- Namespace
- Service account

## How to run

1.  Initialize Terraform:

    ```
    terraform init
    ```

2.  Apply the configuration, passing the `tenant_id` as a variable:

    ```
    terraform apply -var="tenant_id=my-tenant"
    ```

## Inputs

- `tenant_id`: The ID of the tenant to deploy resources for.

## Outputs

- `tenant_namespace`: The name of the tenant's namespace.
- `tenant_service_account`: The name of the tenant's service account.
