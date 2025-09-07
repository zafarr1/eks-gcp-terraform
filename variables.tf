variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region for GKE cluster"
  type        = string
  default     = "asia-east1-a"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "gke-zaf-tf"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.33"
}
