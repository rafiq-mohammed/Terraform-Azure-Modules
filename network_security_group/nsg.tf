resource "azurerm_network_security_group" "nsgs" {
  for_each                    = var.nsg_array
  name                        = each.value["nsg_name"]
  location                    = each.value["location"]
  resource_group_name         = each.value["resource_group_name"]
  depends_on                  = [var.nsg_depends_on]
}

resource "azurerm_network_security_rule" "nsg_rules" {
  for_each                    = var.nsg_array
  name                        = each.key
  priority                    = each.value["priority"]
  direction                   = each.value["direction"]
  access                      = each.value["access"]
  protocol                    = each.value["protocol"]
  source_port_range           = each.value["source_port_range"]
  destination_port_range      = each.value["destination_port_range"]
  source_address_prefix       = each.value["source_address_prefixes"]
  destination_address_prefix  = each.value["destination_address_prefix"]
  resource_group_name         = each.value["resource_group_name"]
  network_security_group_name = each.value["nsg_name"]
  depends_on                  = [azurerm_network_security_group.nsgs]
}