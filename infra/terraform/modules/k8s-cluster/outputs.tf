output "kubeconfig" {
  value = "# Placeholder for kubeconfig. This should be generated based on the cluster created."
  sensitive = true
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "node_pools" {
  value = {
    "primary" = {
      "id" = google_container_node_pool.primary_nodes.id
    }
  }
}
