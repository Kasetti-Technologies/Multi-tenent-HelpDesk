terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.7.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.5.1"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.9.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

data "google_client_config" "default" {}

module "k8s-cluster" {
  source = "./modules/k8s-cluster"
  gcp_project_id = var.gcp_project_id
  gcp_region = var.gcp_region
}

module "postgres" {
  source = "./modules/postgres"
  gcp_region = var.gcp_region
  db_password = var.db_password
}

data "google_container_cluster" "my_cluster" {
  name     = module.k8s-cluster.cluster_name
  location = var.gcp_region
  project  = var.gcp_project_id
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

module "qdrant" {
  source = "./modules/qdrant"
  gcp_region = var.gcp_region
}
