output "kubernetes_dashboard_url" {
  description = "URL to access Kubernetes Dashboard"
  value     = "http://localhost:8001/api/v1/namespaces/${var.apps["kubernetes_dashboard"].namespace}/services/http:${var.apps["kubernetes_dashboard"].name}:443/proxy"
}