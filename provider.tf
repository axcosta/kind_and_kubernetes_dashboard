terraform {
  required_providers {
    kind        = {
      source  = "tehcyx/kind"
      version = ">= 0.2"
    }            
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.9"
    }
    kubernetes  = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.22"
    }
  }
}

provider "kind" {}

provider "helm" {
  kubernetes {    
    host                    = "${kind_cluster.lab_k8s_cluster.endpoint}"
    cluster_ca_certificate  = "${kind_cluster.lab_k8s_cluster.cluster_ca_certificate}"
    client_certificate      = "${kind_cluster.lab_k8s_cluster.client_certificate}"
    client_key              = "${kind_cluster.lab_k8s_cluster.client_key}"  
  }
}

provider "kubernetes" {  
  host                    = "${kind_cluster.lab_k8s_cluster.endpoint}"
  cluster_ca_certificate  = "${kind_cluster.lab_k8s_cluster.cluster_ca_certificate}"
  client_certificate      = "${kind_cluster.lab_k8s_cluster.client_certificate}"
  client_key              = "${kind_cluster.lab_k8s_cluster.client_key}"
}