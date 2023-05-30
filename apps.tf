#********************************************************************************#
#                      Kubernetes Dashboard                                      #
#********************************************************************************#
resource "helm_release" "kubernetes_dashboard" {
  name              = var.apps["kubernetes_dashboard"].name
  repository        = var.apps["kubernetes_dashboard"].repository
  chart             = var.apps["kubernetes_dashboard"].chart
  version           = var.apps["kubernetes_dashboard"].version
  namespace         = var.apps["kubernetes_dashboard"].namespace
  create_namespace  = var.apps["kubernetes_dashboard"].create_namespace
  values            = [ yamlencode(var.apps["kubernetes_dashboard"].options) ]  
  set {
    name  = "settings.clusterName"
    value = var.cluster.name
  }
  depends_on        = [ kind_cluster.lab_k8s_cluster ]
}
resource "kubernetes_cluster_role_binding" "default_user" {
  metadata {
    name = var.apps["kubernetes_dashboard"].name    
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = var.apps["kubernetes_dashboard"].name
    namespace = var.apps["kubernetes_dashboard"].namespace
  }  
  depends_on = [ helm_release.kubernetes_dashboard ]
}
data "kubernetes_service" "dashboard" {
  metadata {
    name      = var.apps["kubernetes_dashboard"].name
    namespace = var.apps["kubernetes_dashboard"].namespace
  }
  depends_on = [ helm_release.kubernetes_dashboard ]
}
data "kubernetes_nodes" "info" {  
  depends_on = [ kind_cluster.lab_k8s_cluster ]
}