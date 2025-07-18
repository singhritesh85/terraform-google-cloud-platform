module "gke" {

  source = "../module"
  project_name = var.project_name
  gcp_region = var.gcp_region[1]
  prefix = var.prefix
  ip_range_subnet = var.ip_range_subnet
  master_ip_range = var.master_ip_range
  min_master_version = var.min_master_version[0]
  node_version = var.node_version[0]
  pods_ip_range = var.pods_ip_range
  services_ip_range = var.services_ip_range
  ip_public_range_subnet = var.ip_public_range_subnet
  machine_type = var.machine_type
  env = var.env[0]

}
