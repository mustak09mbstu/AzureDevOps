data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_user_assigned_identity" "base" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.identity_name
  tags                = var.tags
}

resource "azurerm_role_assignment" "sp" {
  scope                = azurerm_user_assigned_identity.base.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = var.service_principal_object_id
  depends_on           = [azurerm_user_assigned_identity.base]
}

resource "azurerm_role_assignment" "gwnetwork" {
  scope                = var.appgatewayid
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.base.principal_id
  depends_on           = [azurerm_user_assigned_identity.base]
}

resource "azurerm_role_assignment" "rggroup" {
  scope                = data.azurerm_resource_group.rg.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.base.principal_id
  depends_on           = [azurerm_user_assigned_identity.base]
}