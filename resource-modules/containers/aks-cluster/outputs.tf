output "aks_id" {
  value = azurerm_kubernetes_cluster.base.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.base.fqdn
}

output "aks_node_resource_group" {
  value = azurerm_kubernetes_cluster.base.node_resource_group
}

output "aks_kube_admin_config_raw" {
  value = azurerm_kubernetes_cluster.base.kube_admin_config_raw
}

output "aks_kube_admin_config_client_key" {
  value = azurerm_kubernetes_cluster.base.kube_admin_config.0.client_key
}

output "aks_kube_admin_config_client_certificate" {
  value = azurerm_kubernetes_cluster.base.kube_admin_config.0.client_certificate
}

output "aks_kube_admin_config_cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.base.kube_admin_config.0.cluster_ca_certificate
}

output "aks_kube_admin_config_host" {
  value = azurerm_kubernetes_cluster.base.kube_admin_config.0.host
}

output "aks_kube_admin_config_username" {
  value = azurerm_kubernetes_cluster.base.kube_admin_config.0.username
}

output "aks_kube_admin_config_password" {
  value = azurerm_kubernetes_cluster.base.kube_admin_config.0.password
}
