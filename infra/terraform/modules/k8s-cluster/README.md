# Kubernetes Cluster Module

This module provisions a Kubernetes cluster.

## How to implement

- Replace the placeholder `google_container_cluster` resource with your cloud provider's Kubernetes cluster resource (e.g., `aws_eks_cluster`, `azurerm_kubernetes_cluster`).
- Configure the cluster size and other parameters in `variables.tf`.
- Ensure IAM roles for service accounts are enabled.

## Inputs

- `cloud_provider`: The cloud provider to use (e.g., `gcp`, `aws`, `azure`).
- `cluster_size`: The size of the cluster (e.g., `small`, `medium`, `large`).
- `region`: The region to deploy the cluster in.
- `tags`: A map of tags to apply to the cluster resources.

## Outputs

- `kubeconfig`: The kubeconfig file for the cluster.
- `cluster_name`: The name of the cluster.
- `node_pools`: A map of the node pools in the cluster.
