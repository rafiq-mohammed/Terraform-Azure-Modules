#
resource "azurerm_subnet" "subnets" {
    for_each             = var.subnet_array
    name                 = each.key
    address_prefixes     = [each.value["address"]]
    resource_group_name  = each.value["resource_group"]
    virtual_network_name = each.value["vnet_name"]
    depends_on           = [var.subnet_depends_on]
}