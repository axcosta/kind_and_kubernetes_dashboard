# TODO: This does not work with current Kubernetes Provider
# Opened a PR to address this => https://github.com/hashicorp/terraform-provider-kubernetes/issues/2124
# output "kubernetes_dashboard_url" { 
#   description = "URL to access Kubernetes Dashboard"
#   value = "http://${local.node_ip_address}:${data.kubernetes_service.dashboard.port}"
# }

output "kubernetes_dashboard_service_node_port" {
  description = "NodePort assigned to access Kubernetes Dashboard service"
  value       = "${data.kubernetes_service.dashboard.spec[0].port[0].node_port}"
}
