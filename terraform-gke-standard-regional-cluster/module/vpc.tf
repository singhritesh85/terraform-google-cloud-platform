############################## Create VPC in GCP #######################################

# Create VPC in GCP
resource "google_compute_network" "gke_vpc" {
  name = "${var.prefix}-vpc"
  auto_create_subnetworks = false   
}

# Create Private Subnet for VPC in GCP
resource "google_compute_subnetwork" "gke_subnet" {
  name = "${var.prefix}-${var.gcp_region}-private-subnet"
  region = var.gcp_region
  network = google_compute_network.gke_vpc.id 
  private_ip_google_access = true           ### VMs in this Subnet without external IP
  ip_cidr_range = var.ip_range_subnet
  secondary_ip_range {
    range_name    = "secondary-ip-range-for-pods"
    ip_cidr_range = var.pods_ip_range
  }
  secondary_ip_range {
    range_name    = "secondary-ip-range-for-service"
    ip_cidr_range = var.services_ip_range
  }
}

# Create Public Subnet for VPC in GCP
resource "google_compute_subnetwork" "gke_public_subnet" {
  name = "${var.prefix}-${var.gcp_region}-public-subnet"
  region = var.gcp_region
  network = google_compute_network.gke_vpc.id
  ip_cidr_range = var.ip_public_range_subnet
}

