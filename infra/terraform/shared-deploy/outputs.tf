output "kubeconfig" {
  value = module.k8s-cluster.kubeconfig
  sensitive = true
}

output "cluster_name" {
  value = module.k8s-cluster.cluster_name
}

output "db_host" {
  value = module.postgres.db_host
}

output "db_port" {
  value = module.postgres.db_port
}

output "qdrant_host" {
  value = module.qdrant.qdrant_host
}

output "qdrant_port" {
  value = module.qdrant.qdrant_port
}
