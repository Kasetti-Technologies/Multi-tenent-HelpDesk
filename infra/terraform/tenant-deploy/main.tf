terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.11"
    }
    # vault = {
    #   source = "hashicorp/vault"
    #   version = "~> 3.2"
    # }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config" # Assumes kubeconfig is in the default location
}

# provider "vault" {
#   address = "http://127.0.0.1:8200" # Example Vault address
# }

module "tenant" {
  source    = "../modules/tenant"
  tenant_id = var.tenant_id
  kubeconfig = var.kubeconfig
}
