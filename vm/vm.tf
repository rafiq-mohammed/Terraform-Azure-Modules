provider "azurerm" {
  features {}
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.nic_rsg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.vnet_subnet_id
    private_ip_address_allocation = var.nic_private_id_address_allocation
    private_ip_address            = var.nic_private_ip_address
  }
}
resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                  = var.linuxvm_name
  resource_group_name   = var.linuxvm_rsg_name
  location              = var.linuxvm_location
  size                  = var.linuxvm_size
  admin_username        = var.linuxvm_admin_username
  network_interface_ids = [azurerm_network_interface.nic.id]


  admin_ssh_key {
    username   = var.linuxvm_username
    public_key = var.linuxvm_public_key
  }
  os_disk {
    caching              = var.linuxvm_caching
    storage_account_type = var.linuxvm_storage_account_type
  }
  source_image_reference {
    publisher = var.linuxvm_publisher
    offer     = var.linuxvm_offer
    sku       = var.linuxvm_sku
    version   = var.linuxvm_version
  }
  depends_on = [
    azurerm_network_interface.nic
  ]
}