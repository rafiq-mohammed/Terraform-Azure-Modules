provider "azurerm" {
  features {}
}

resource "azurerm_postgresql_server" "postgres" {
  name                = var.pg_name
  location            = var.location
  resource_group_name = var.rg_name

  sku_name = var.sku_name

  storage_profile {
    storage_mb            = var.storage_mb
    backup_retention_days = var.backup_retention_days
    geo_redundant_backup  = var.geo_redundant_backup
  }

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  version                      = var.version_pg
  ssl_enforcement              = var.ssl_enforcement
}

resource "azurerm_postgresql_virtual_network_rule" "postgres-vnet" {
  name                                 = var.vnet_pg
  resource_group_name                  = var.rg_name
  server_name                          = azurerm_postgresql_server.postgres.name
  subnet_id                            = var.vnet_subnet_id
  ignore_missing_vnet_service_endpoint = var.ignore_missing_vnet_service_endpoint
}

resource "azurerm_private_endpoint" "postgres-pep" {
  name                = var.pep_name
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.pep_subnet_id

  private_service_connection {
    name                           = var.psc_name
    private_connection_resource_id = azurerm_postgresql_server.postgres.id
    subresource_names              = [ var.psc_subresource_names ]
    is_manual_connection           = false
  }
}