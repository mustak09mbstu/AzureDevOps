
resource "azurerm_application_security_group" "asg" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.asg_name
  tags                = var.tags
}
