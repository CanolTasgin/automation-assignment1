output "postgresql_server_name" {
  value       = azurerm_postgresql_server.postgres.name
  description = "Postgres Server Name"
}
