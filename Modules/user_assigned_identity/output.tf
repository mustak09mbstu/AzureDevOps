output "identity_id" {
  value = azurerm_user_assigned_identity.base.id
}

output "identity_principal_id" {
  value = azurerm_user_assigned_identity.base.principal_id
}

output "identity_client_id" {
  value = azurerm_user_assigned_identity.base.client_id
}

output "identity_name" {
  value = azurerm_user_assigned_identity.base.name
}