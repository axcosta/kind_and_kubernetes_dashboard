# Lab with Kind, Terraform and Kubernetes Dashboard

This is a lab experiment using Terraform that:

- creates a single node Kind Kubernetes cluster and
- installs Kubernetes Dashboard (insecure mode).

## Tools

| Name      | Version   |
|-----------|-----------|
| Git       | 2.34.1    |
| Terraform | 1.4.5     |
| Kubectl   | 1.27.1    |

## Step by step

1. Install all tools;
2. Using an IDE such as VS Code or even any terminal, clone locally this repository with Git;
3. Run `terraform init` to install required Terraform plugins;
4. Run `terraform apply -auto-approve` which will create all the following resources:
    | Name                  | Version   |
    |-----------------------|-----------|
    | Kind (cluster)        | 0.19.0    |
    | Kubernetes Dashboard  | 2.7.0     |
5. Run `kubectl get nodes -o wide` and note down `INTERNAL-IP` column data
6. Look at Terraform Output for the variable `kubernetes_dashboard_service_node_port` and note down
7. Access Kubernetes dashboard with URL `http://<INTERNAL-IP>:kubernetes_dashboard_service_node_port`
8. On the login screen, click on "Skip".

## Terraform Docs

Below is the documentation of Terraform code produced to this lab.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.9.0 |
| <a name="requirement_kind"></a> [kind](#requirement\_kind) | 0.0.13 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.9.0 |
| <a name="provider_kind"></a> [kind](#provider\_kind) | 0.0.13 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.kubernetes_dashboard](https://registry.terraform.io/providers/hashicorp/helm/2.9.0/docs/resources/release) | resource |
| [kind_cluster.lab_k8s_cluster](https://registry.terraform.io/providers/tehcyx/kind/0.0.13/docs/resources/cluster) | resource |
| [kubernetes_cluster_role_binding.default_user](https://registry.terraform.io/providers/hashicorp/kubernetes/2.20.0/docs/resources/cluster_role_binding) | resource |
| [kubernetes_nodes.info](https://registry.terraform.io/providers/hashicorp/kubernetes/2.20.0/docs/data-sources/nodes) | data source |
| [kubernetes_service.dashboard](https://registry.terraform.io/providers/hashicorp/kubernetes/2.20.0/docs/data-sources/service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apps"></a> [apps](#input\_apps) | Information to configure applications in K8s Cluster | `map` | <pre>{<br>  "kubernetes_dashboard": {<br>    "chart": "kubernetes-dashboard",<br>    "create_namespace": true,<br>    "name": "kubernetes-dashboard-lab",<br>    "namespace": "kubernetes-dashboard-lab",<br>    "options": {<br>      "extraArgs": [<br>        "--enable-skip-login",<br>        "--enable-insecure-login",<br>        "--system-banner=\"Welcome to Kubernetes\""<br>      ],<br>      "protocolHttp": true,<br>      "service": {<br>        "externalPort": 443,<br>        "type": "NodePort"<br>      },<br>      "settings": {<br>        "disableAccessDeniedNotifications": false,<br>        "itemsPerPage": 10,<br>        "logsAutoRefreshTimeInterval": 5,<br>        "resourceAutoRefreshTimeInterval": 5<br>      }<br>    },<br>    "repository": "https://kubernetes.github.io/dashboard/",<br>    "version": "6.0.8"<br>  }<br>}</pre> | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Information to configure the K8s Cluster | `map` | <pre>{<br>  "api_version": "kind.x-k8s.io/v1alpha4",<br>  "name": "kind-lab-k8s-cluster",<br>  "node_image": "kindest/node:v1.24.0"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_dashboard_service_node_port"></a> [kubernetes\_dashboard\_service\_node\_port](#output\_kubernetes\_dashboard\_service\_node\_port) | NodePort assigned to access Kubernetes Dashboard service |
<!-- END_TF_DOCS -->