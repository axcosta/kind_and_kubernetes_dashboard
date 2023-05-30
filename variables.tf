variable "cluster" {
    description = "Information to configure the K8s Cluster"
    default     = {
        name        = "kind-lab-k8s-cluster"
        node_image  = "kindest/node:v1.24.0"
        api_version = "kind.x-k8s.io/v1alpha4"
    }
    nullable    = false
}
variable "apps" {
    description = "Information to configure applications in K8s Cluster"
    default     = {
        kubernetes_dashboard = {
            name                = "kubernetes-dashboard-lab"
            repository          = "https://kubernetes.github.io/dashboard/"
            chart               = "kubernetes-dashboard"
            version             = "6.0.8"
            namespace           = "kubernetes-dashboard-lab"
            create_namespace    = true
            options             = {
                extraArgs   = [
                    "--enable-skip-login",
                    "--enable-insecure-login",
                    "--system-banner=\"Welcome to Kubernetes\""
                ]
                ## Serve application over HTTP without TLS
                protocolHttp = true
                service     = {
                    type            = "NodePort"
                    externalPort    = 443
                }  
                settings    = {
                    # Max number of items that can be displayed on each list page
                    itemsPerPage                        = 10
                    # Number of seconds between every auto-refresh of logs
                    logsAutoRefreshTimeInterval         = 5
                    # Number of seconds between every auto-refresh of every resource. Set 0 to disable
                    resourceAutoRefreshTimeInterval     = 5
                    # Hide all access denied warnings in the notification panel
                    disableAccessDeniedNotifications    = false
                }
            }
            
        }        
    }
    nullable    = false
}