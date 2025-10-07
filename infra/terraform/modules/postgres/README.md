# PostgreSQL Module

This module provisions a managed PostgreSQL instance.

## How to implement

- Replace the placeholder `google_sql_database_instance` resource with your cloud provider's PostgreSQL resource (e.g., `aws_db_instance`, `azurerm_postgresql_server`).
- Configure the database password and other parameters in `variables.tf`.

## Inputs

- `db_password`: The password for the database.
- `region`: The region to deploy the database in.

## Outputs

- `db_host`: The hostname of the database.
- `db_port`: The port of the database.
- `db_name`: The name of the database.
