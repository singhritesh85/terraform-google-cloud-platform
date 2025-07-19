module "cloud_mysql" {

  source = "../module"
  project_name = var.project_name
  gcp_region = var.gcp_region[1]
  database_version = var.database_version[2]
  prefix = var.prefix
  ip_range_subnet = var.ip_range_subnet
  ip_public_range_subnet = var.ip_public_range_subnet
  tier = var.tier[0]
  env = var.env[0]

}
