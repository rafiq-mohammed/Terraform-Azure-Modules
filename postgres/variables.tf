########################azurerm_postgresql_server
variable "pg_name" {}
variable "location" {}
variable "rg_name" {}
variable "sku_name" {}
variable "storage_mb" {}
variable "backup_retention_days" {}
variable "geo_redundant_backup" {}
variable "administrator_login" {}
variable "administrator_login_password" {}
variable "version_pg" {}
variable "ssl_enforcement" {}

########################azurerm_postgresql_virtual_network_rule
variable "vnet_pg" {}
variable "vnet_subnet_id" {}
variable "ignore_missing_vnet_service_endpoint" {}

########################azurerm_private_endpoint
variable "pep_name" {}
variable "pep_subnet_id" {}
variable "psc_name" {}
variable "psc_subresource_names" {}
#variable "is_manual_connnection" {}