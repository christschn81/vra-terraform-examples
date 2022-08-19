resource "random_pet" "rg-name" {
  prefix    = var.prefix
}

resource "azurerm_resource_group" "rg" {
  name     = random_pet.rg-name.id
  location = var.location
}

# Data source to get Latest Azure AKS latest Version
data "azurerm_kubernetes_service_versions" "current" {
  location        = var.location
  include_preview = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = random_pet.rg-name.id
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.prefix}-k8s"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "systempool"
    node_count = var.system_pool_node_count
    vm_size    = var.system_pool_vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}
  
resource "azurerm_kubernetes_cluster_node_pool" "aks" {
  name                   = "userpool"
  kubernetes_cluster_id  = azurerm_kubernetes_cluster.aks.id
  vm_size                = var.user_pool_vm_size
  enable_auto_scaling    = true
  max_count              = var.user_pool_max_count
  min_count              = var.user_pool_min_count
  enable_node_public_ip  = false

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]

  lifecycle {
    ignore_changes = [
      name
    ]
  }
}
