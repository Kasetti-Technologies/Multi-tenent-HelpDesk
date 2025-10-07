# Shared-Deploy Environment

This environment provisions the shared infrastructure, including:

- Kubernetes cluster
- PostgreSQL database
- Qdrant vector database

## How to run

1. Initialize Terraform:
   ```
   terraform init
   ```
2. Apply the configuration:
   ```
   terraform apply
   ```

## Inputs

- `gcp_project_id`: The GCP project ID to deploy to.
- `gcp_region`: The GCP region to deploy to.
- `db_password`: The password for the PostgreSQL database.

## Outputs

- `kubeconfig`: The kubeconfig for the Kubernetes cluster.
- `cluster_name`: The name of the Kubernetes cluster.
- `db_host`: The hostname of the PostgreSQL database.
- `db_port`: The port of the PostgreSQL database.
- `qdrant_host`: The hostname of the Qdrant service.
- `qdrant_port`: The port of the Qdrant service.
