########################azurerm_network_interface
variable "nic_name" {}
variable "nic_location" {}
variable "nic_rsg_name" {}
variable "vnet_subnet_id" {}
variable "nic_private_id_address_allocation" {}
variable "nic_private_ip_address" {}
#######################azurerm_linux_virtual_machine
variable "linuxvm_name" {}
variable "linuxvm_rsg_name" {}
variable "linuxvm_location" {}
variable "linuxvm_size" {}
variable "linuxvm_admin_username" {}
variable "linuxvm_username" {}
variable "linuxvm_public_key" {}
variable "linuxvm_caching" {}
variable "linuxvm_storage_account_type" {}
variable "linuxvm_publisher" {}
variable "linuxvm_offer" {}
variable "linuxvm_sku" {}
variable "linuxvm_version" {}