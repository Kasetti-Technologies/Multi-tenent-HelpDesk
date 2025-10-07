# Shared deploy: provision shared k8s cluster + managed Postgres/Qdrant,
# install ArgoCD, and deploy Helm releases for core services (shared-schema model).
terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.7.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.9.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.20.0"
    }
  }
}

# Replace provider block with your cloud provider module (AWS/GCP/Azure).
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

# Data sources to connect to the created k8s cluster
data "google_client_config" "default" {}

data "google_container_cluster" "my_cluster" {
  name     = module.k8s_cluster.cluster_name
  location = var.gcp_region
  project  = var.gcp_project_id
  depends_on = [module.k8s_cluster]
}

provider "helm" {
  kubernetes {
    host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
  }
}

provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate)
}

# Variables
variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to deploy to"
}

variable "gcp_region" {
  type        = string
  description = "The GCP region to deploy to"
  default     = "us-central1"
}

variable "cluster_size" {
  type        = string
  description = "Size of the cluster (e.g., small, medium, large)"
  default     = "medium"
}

variable "db_password" {
  type        = string
  description = "The password for the database"
  sensitive   = true
}

# Shared Modules
module "k8s_cluster" {
  source       = "./modules/k8s-cluster"
  gcp_project_id = var.gcp_project_id
  gcp_region   = var.gcp_region
  cluster_size = var.cluster_size
}

module "postgres" {
  source      = "./modules/postgres"
  gcp_region  = var.gcp_region
  db_password = var.db_password
}

module "qdrant" {
  source     = "./modules/qdrant"
  gcp_region = var.gcp_region
}
