variable "project_name" {
  description = "Provide the project name in GCP Account"
  type = string
}

variable "gcp_region" {
  description = "Provide the GCP Region in which Resources to be created"
  type = list
}

variable "prefix" {
  description = "Provide the prefix used for the project"
  type = string
}

variable "ip_range_subnet" {
  description = "Provide the IP range for Private Subnet"
  type = string 
}

variable "ip_public_range_subnet" {
  description = "Provide the IP range for Public Subnet"
  type = string
}

variable "database_version" {
  description = "Provide the database version DB Instance"
  type = list
}

variable "tier" {
  description = "Provide the Machine Type for VM Instances"
  type = list
}

variable "env" {
  type = list
  description = "Provide the Environment for EKS Cluster and NodeGroup"
}
