output "db_instance_name" {
  value = google_sql_database_instance.db_instance.name
}

output "db_connection_name" {
  value = google_sql_database_instance.db_instance.connection_name
}

output "db_instance_private_ip_address" {
  value = google_sql_database_instance.db_instance.private_ip_address
}
