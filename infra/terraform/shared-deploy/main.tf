terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.5"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.11"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

module "k8s-cluster" {
  source       = "../modules/k8s-cluster"
  gcp_project_id = var.gcp_project_id
  gcp_region   = var.gcp_region
}

module "postgres" {
  source      = "../modules/postgres"
  gcp_region  = var.gcp_region
  db_password = var.db_password
}

module "qdrant" {
  source     = "../modules/qdrant"
  gcp_region = var.gcp_region
}
