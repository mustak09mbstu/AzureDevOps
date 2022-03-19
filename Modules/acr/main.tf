resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.skutype
  tags                     = var.tags
  admin_enabled            = true
}

resource "azurerm_private_endpoint" "PrivateEndPointAcr" {
  name                = var.private_endpoint_name_for_ACR
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.acrsubnet

  private_service_connection {
    name                           = var.private_endpoint_service_connection_name_for_acr
    is_manual_connection           = false
    private_connection_resource_id = azurerm_container_registry.acr.id
    subresource_names              = ["registry"]
  }

}