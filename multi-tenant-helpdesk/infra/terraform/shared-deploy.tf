# Shared deploy: provision shared k8s cluster + managed Postgres/Redis/Qdrant,
# install ArgoCD, and deploy Helm releases for core services (shared-schema model).
# Replace provider block with your cloud provider module (AWS/GCP/Azure).
terraform {
  required_version = ">= 1.0"
}

# Providers (placeholder)
provider "kubernetes" {
  # config...
}

# Variables (placeholder)
variable "cloud_provider" { type = string default = "aws" }
variable "cluster_size" { type = string default = "medium" }
variable "vault_addr" { type = string default = "" }

# Example modules (stubs) — implement in infra/terraform/modules/*
module "k8s_cluster" {
  source = "./modules/k8s-cluster"
  # inputs: cloud_provider, cluster_size, ... 
}

module "postgres" {
  source = "./modules/postgres"
  # outputs: postgres_endpoint, postgres_secret_id
}

module "qdrant" {
  source = "./modules/qdrant"
  # outputs: qdrant_endpoint
}

# ArgoCD install (could be helm provider or module)
# Helm releases for core services: rag-service, llm-gateway, tool-registry, ingestion-worker, admin-ui
# Use ArgoCD App-of-Apps pattern or helm provider here (placeholder).
