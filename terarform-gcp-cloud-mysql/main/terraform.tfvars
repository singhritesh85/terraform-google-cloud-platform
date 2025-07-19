################## Parameters for GCP to be used for the Project ######################

project_name = "XXXX-XXXXXXX-2XXXX6"  ### Provide the GCP Account Project ID. 

gcp_region = ["us-east1", "us-central1", "asia-south2", "asia-south1", "us-west1"]

prefix = "dexter"

ip_range_subnet = "192.168.0.0/24"

ip_public_range_subnet = "172.20.0.0/24"

database_version = ["MYSQL_5_6", "MYSQL_5_7", "MYSQL_8_0", "POSTGRES_11", "POSTGRES_12", "POSTGRES_13", "POSTGRES_14", "POSTGRES_15"]

tier = ["db-f1-micro", "db-n1-standard-1", "db-e2-small", "db-e2-medium", "db-n2-standard-4", "db-c2-standard-4", "db-c3-standard-4"]

env = [ "dev", "stage", "prod" ]
