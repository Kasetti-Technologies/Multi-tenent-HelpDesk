# Terraform for Multi-Tenant SaaS

This repository contains Terraform code to provision a multi-tenant SaaS application on Google Cloud Platform (GCP).

## Structure

The Terraform code is organized into two main environments:

- `shared-deploy`: Provisions the shared infrastructure, including:
  - A Google Kubernetes Engine (GKE) cluster.
  - A Cloud SQL for PostgreSQL instance.
  - A Qdrant vector database deployment.
- `tenant-deploy`: Provisions tenant-specific resources, including:
  - A dedicated namespace for each tenant.
  - A service account for each tenant.

## Modules

The environments use the following Terraform modules:

- `k8s-cluster`: Creates a GKE cluster.
- `postgres`: Creates a Cloud SQL for PostgreSQL instance.
- `qdrant`: Deploys Qdrant using the official Helm chart.
- `tenant`: Creates tenant-specific resources, such as namespaces and service accounts.

## How to Use

1.  **Provision Shared Infrastructure:**

    - Navigate to the `shared-deploy` directory.
    - Initialize Terraform:

      ```
      terraform init
      ```

    - Apply the configuration:

      ```
      terraform apply
      ```

2.  **Provision Tenant-Specific Resources:**

    - Navigate to the `tenant-deploy` directory.
    - Initialize Terraform:

      ```
      terraform init
      ```

    - Apply the configuration, passing the `tenant_id` as a variable:

      ```
      terraform apply -var="tenant_id=<tenant-id>"
      ```

## Future Enhancements

- [ ] Implement a CI/CD pipeline for automated deployments.
- [ ] Integrate with a secrets management solution like HashiCorp Vault.
- [ ] Add more sophisticated tenant isolation and resource quotas.
- [ ] Develop a more robust monitoring and logging solution.
- [ ] Create a more detailed and comprehensive README for each module.

This is a basic framework for a multi-tenant SaaS application. You can customize and extend it to meet your specific requirements.
