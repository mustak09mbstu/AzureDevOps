output "applicationgateway" {
  description = "The Name of the newly created vNet"
  value       = azurerm_application_gateway.network.name
}

output "appgatewayid" {
  description = "id of the application gateway"
  value = azurerm_application_gateway.network.id
}