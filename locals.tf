locals {
    node_ip_address = data.kubernetes_nodes.info.nodes[0].status[0].addresses[0].address
}