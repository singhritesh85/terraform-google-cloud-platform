############################## Create VPC in GCP #######################################

# Create VPC in GCP
resource "google_compute_network" "gcp_vpc" {
  name = "${var.prefix}-vpc"
  auto_create_subnetworks = false   
}

# Create Private Subnet for VPC in GCP
resource "google_compute_subnetwork" "gcp_private_subnet" {
  name = "${var.prefix}-${var.gcp_region}-private-subnet"
  region = var.gcp_region
  network = google_compute_network.gcp_vpc.id 
  private_ip_google_access = true           ### VMs in this Subnet without external IP
  ip_cidr_range = var.ip_range_subnet
}

# Create Public Subnet for VPC in GCP
resource "google_compute_subnetwork" "gcp_public_subnet" {
  name = "${var.prefix}-${var.gcp_region}-public-subnet"
  region = var.gcp_region
  network = google_compute_network.gcp_vpc.id
  private_ip_google_access = false           ### VMs in this Subnet with external IP
  ip_cidr_range = var.ip_public_range_subnet
}


