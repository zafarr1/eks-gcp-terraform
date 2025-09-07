terraform {
  backend "gcs" {
    bucket      = "tfbucket-state-1"
    prefix      = "gke-cluster"
  }
}