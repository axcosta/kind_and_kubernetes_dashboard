# locals {
# TODO: This does not work with current Kubernetes Provider
# Opened a PR to address this => https://github.com/hashicorp/terraform-provider-kubernetes/issues/2124
#   node_ip_address = data.kubernetes_nodes.kubernetes_nodes.nodes[0].status[0].addresses[0].address
# }