output "gcp_db_instance_details" {
  description = "Details of the Google Cloud DB Instance"
  value       = "${module.cloud_mysql}"
}

