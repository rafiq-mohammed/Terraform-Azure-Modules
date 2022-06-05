#
resource "azurerm_kubernetes_cluster" "aks" {
  name                       = var.aks_name
  location                   = var.aks_location
  resource_group_name        = var.aks_rg_name
  dns_prefix                 = "${var.aks_name}-dns"
  private_cluster_enabled    = var.private_cluster_enabled
  linux_profile {
    admin_username           = var.admin_username
    ssh_key {
      key_data               = var.public_ssh_key
    }
  }
  default_node_pool {
    name                      = "default"
    vm_size                   = var.vm_size
    vnet_subnet_id            = var.vnet_subnet_id
    enable_auto_scaling       = var.enable_auto_scaling
    node_count                = var.initial_node_count
    min_count                 = var.min_node_count
    max_count                 = var.max_node_count
    max_pods                  = var.max_pods
  }
  network_profile {
    network_plugin            = var.network_plugin
    service_cidr              = var.service_cidr
    pod_cidr                  = var.pod_cidr
    dns_service_ip            = var.dns_service_ip
    docker_bridge_cidr        = var.docker_bridge_cidr
  }
  service_principal {
    client_id                 = var.client_id
    client_secret             = var.client_secret 
  }
}