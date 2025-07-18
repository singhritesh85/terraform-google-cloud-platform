################## Parameters for GCP to be used for the Project ######################

project_name = "XXXX-XXXXXXX-2XXXX6"  ### Provide the GCP Account Project ID. 

gcp_region = ["us-east1", "us-central1", "asia-south2", "asia-south1", "us-west1"]

prefix = "dexter"

ip_range_subnet = "10.10.0.0/20"

master_ip_range = "172.16.0.0/28"

min_master_version = ["1.33.1", "1.32.4", "1.30.12"] ###["v1.33.1-gke.1386000", "v1.32.4-gke.1415000", "v1.30.12-gke.1246000"]

node_version = ["1.33.1", "1.32.4", "1.30.12"]       ###["v1.33.1-gke.1386000", "v1.32.4-gke.1415000", "v1.30.12-gke.1246000"]

pods_ip_range = "172.17.0.0/16"

services_ip_range = "172.19.0.0/16"

ip_public_range_subnet = "10.20.0.0/20"

machine_type = ["n1-standard-1", "e2-small", "e2-medium", "n2-standard-4", "c2-standard-4", "c3-standard-4"]

env = [ "dev", "stage", "prod" ]
