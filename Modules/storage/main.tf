
resource "azurerm_storage_account" "sta" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                     = var.tags
}

resource "azurerm_private_endpoint" "PrivateEndPointStorage" {
  name                = var.private_endpoint_name_for_storage
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.storagesubnet

  private_service_connection {
    name                           = var.private_endpoint_service_connection_name_for_storage
    is_manual_connection           = false
    private_connection_resource_id = azurerm_storage_account.sta.id
    subresource_names              = ["blob"]
  }

}