output "nsg_id" {
  description = "The id of the NSG"
  value       = azurerm_network_security_group.nsg.id
}

output "nsg_name" {
  description = "The Name of NSG"
  value       = azurerm_network_security_group.nsg.name
}