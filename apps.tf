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
  values            = [ file("apps/${var.apps["kubernetes_dashboard"].chart}/values.yaml") ]
  set {
    name  = "settings.clusterName"
    value = var.cluster.name
  }
  depends_on        = [ kind_cluster.lab_k8s_cluster ]
}