# This prints values of all RG names
output "rg_names" {
  value = [for rg in azurerm_resource_group.rg: rg.name]
}