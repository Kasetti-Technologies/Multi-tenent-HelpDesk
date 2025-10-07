output "db_host" {
  value = google_sql_database_instance.default.ip_address[0].ip_address
}

output "db_port" {
  value = "5432"
}

output "db_name" {
  value = "postgres"
}
