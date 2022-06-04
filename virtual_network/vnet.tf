#
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet_array
  name                = each.key
  address_space       = [each.value["address"]]
  resource_group_name = each.value["resource_group"]
  location            = each.value["location"]
  depends_on          = [var.vnet_depends_on]
}