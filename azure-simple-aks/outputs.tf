output "id" {
  value = azurerm_kubernetes_cluster.example.id
}

output "kube_config" {
  value = nonsensitive(azurerm_kubernetes_cluster.example.kube_config_raw)
}

output "client_key" {
  value = nonsensitive(azurerm_kubernetes_cluster.example.kube_config.0.client_key)
}

output "client_certificate" {
  value = nonsensitive(azurerm_kubernetes_cluster.example.kube_config.0.client_certificate)
}

output "cluster_ca_certificate" {
  value = nonsensitive(azurerm_kubernetes_cluster.example.kube_config.0.cluster_ca_certificate)
}

output "host" {
  value = nonsensitive(azurerm_kubernetes_cluster.example.kube_config.0.host)
}
