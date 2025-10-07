# Qdrant Module

This module deploys a Qdrant vector database.

## How to implement

- This module uses a Helm chart to deploy Qdrant. You can customize the values in the `values.yaml` file (not included, you can create one).
- The `helm_release` resource will deploy Qdrant to the Kubernetes cluster.

## Inputs

- `region`: The region to deploy Qdrant in.

## Outputs

- `qdrant_host`: The hostname of the Qdrant service.
- `qdrant_port`: The port of the Qdrant service.
