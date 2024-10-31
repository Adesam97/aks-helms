output "cluster_name" {
  value = azurerm_kubernetes_cluster.main.name
}

output "cluster_resource_group" {
  value = azurerm_resource_group.main.name
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.main.kube_config_raw
  sensitive = true
}