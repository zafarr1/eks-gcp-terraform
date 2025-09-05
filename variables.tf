variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for GKE cluster"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "demo-gke"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.33"
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 2
}
