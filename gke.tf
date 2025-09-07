resource "google_compute_network" "vpc" {
  name                    = "${var.cluster_name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.cluster_name}-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc.id
  subnetwork               = google_compute_subnetwork.subnet.id
  min_master_version       = var.kubernetes_version
}

resource "google_container_node_pool" "primary_nodes" {
  name               = "${var.cluster_name}-node-pool"
  location           = var.region
  cluster            = google_container_cluster.primary.name
  initial_node_count = 2 # small number to fit SSD quota

  node_config {
    machine_type = "e2-micro"
    disk_size_gb = 50 # small SSD to fit quota
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
    preemptible  = true
  }
}