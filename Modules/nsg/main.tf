
resource "azurerm_network_security_group" "nsg" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.nsg_name
  tags                = var.tags
}