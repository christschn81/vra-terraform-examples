resource "random_pet" "rg-name" {
  prefix    = var.prefix
}

resource "azurerm_resource_group" "rg" {
  name     = random_pet.rg-name.id
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}-k8s"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "${var.prefix}-k8s"

  default_node_pool {
    name       = "default"
    node_count = var.system_pool_node_count
    vm_size    = var.system_pool_vm_size
  }

  identity {
    type = "SystemAssigned"
  }
  
  resource "azurerm_kubernetes_cluster_node_pool" "user_pool" {
    name                   = "userpool"
    kubernetes_cluster_id  = azurerm_kubernetes_cluster.aks.id
    vm_size                = var.user_pool_vm_size
    vnet_subnet_id         = azurerm_subnet.snet.id
    enable_auto_scaling    = true
    max_count              = var.user_pool_max_count
    min_count              = var.user_pool_min_count
    enable_node_public_ip  = false
    zones                  = var.user_pool_availability_zones

    depends_on = [
      azurerm_kubernetes_cluster.aks
    ]

    tags = var.tags

    lifecycle {
      ignore_changes = [
        name
      ]
    }
  }
}
