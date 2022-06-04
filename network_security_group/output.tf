#
output "nsg_ids" {
  value = [for nsg in azurerm_network_security_group.nsgs: nsg.id]
}