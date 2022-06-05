#
resource "azurerm_cosmosdb_account" "cosmosdb_mongo" {
  name                              = var.mongodb_name
  location                          = var.cosmosdb_location
  resource_group_name               = var.cosmosdb_rg_name
  offer_type                        = var.offer_type
  kind                              = var.cosmosdb_kind_mongo
  enable_automatic_failover         = var.cosmosdb_automatic_failover
  consistency_policy {
    consistency_level               = var.consistency_level
  }
  geo_location {
    location                        = var.cosmosdb_location
    failover_priority               = 0
  }
  capabilities {
    name                            = "EnableMongo"
  }
}

resource "azurerm_private_endpoint" "cosmosdb_mongo-pep" {
  name                = "${var.mongodb_name}-pep"
  location            = var.cosmosdb_location
  resource_group_name = var.cosmosdb_rg_name
  subnet_id           = var.pep_subnet_id

  private_service_connection {
    name                           = "${var.mongodb_name}-psc"
    private_connection_resource_id = azurerm_cosmosdb_account.cosmosdb_mongo.id
    subresource_names              = [ var.cosmosdb_kind_mongo ]
    is_manual_connection           = false
  }
}