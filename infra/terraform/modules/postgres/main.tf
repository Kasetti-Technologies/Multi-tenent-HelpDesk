# Placeholder for PostgreSQL resource.
# Replace with your cloud provider's PostgreSQL resource.
resource "google_sql_database_instance" "default" {
  name             = "postgres-instance"
  database_version = "POSTGRES_13"
  region           = var.gcp_region
  settings {
    tier = "db-g1-small"
  }
}
