# Placeholder for Kubernetes cluster resource.
# Replace with your cloud provider's Kubernetes cluster resource.
resource "google_container_cluster" "primary" {
  name     = "primary-cluster"
  location = var.gcp_region
  project  = var.gcp_project_id

  # We can't create a cluster with no node pool defined, but we want to use
  # a node pool managed by a separate resource.
  remove_default_node_pool = true
  initial_node_count       = 1

  # Enable IAM roles for service accounts
  workload_identity_config {
    workload_pool = "${var.gcp_project_id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.gcp_region
  cluster    = google_container_cluster.primary.name
  project    = var.gcp_project_id
  node_count = 1

  node_config {
    machine_type = "n1-standard-1"
  }
}
