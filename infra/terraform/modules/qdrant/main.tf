# Deploys Qdrant using the official Helm chart.
resource "helm_release" "qdrant" {
  name       = "qdrant"
  repository = "https://qdrant.github.io/qdrant-helm"
  chart      = "qdrant"
  version    = "0.3.5"

  # Values to customize the Qdrant deployment.
  # Create a `values.yaml` file to override the defaults.
  # values = [
  #   file("${path.module}/values.yaml")
  # ]
}
