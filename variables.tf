variable "cluster" {
    description = "Information to configure the K8s Cluster"
    default     = {
        name        = "kind-lab-k8s-cluster"
        node_image  = "kindest/node:v1.24.0"
        api_version = "kind.x-k8s.io/v1alpha4"
    }
    nullable    = true
}
variable "apps" {
    description = "Information to configure applications in K8s Cluster"
    default     = {
        kubernetes_dashboard = {
            name                    = "kubernetes-dashboard-lab"
            repository              = "https://kubernetes.github.io/dashboard/"
            chart                   = "kubernetes-dashboard"
            version                 = "6.0.8"
            namespace               = "kubernetes-dashboard-lab"
            create_namespace        = true            
        }        
    }
    nullable    = false
}