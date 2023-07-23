output "kubernetes_dashboard_url" { 
  description = "URL to access Kubernetes Dashboard"
  value = "http://${local.node_ip_address}:${data.kubernetes_service.dashboard.spec[0].port[0].node_port}"
}
