output "asg_id" {
  description = "The id of the newly created ASG"
  value       = azurerm_application_security_group.asg.id
}

output "asg_name" {
  description = "The Name of the newly created ASG"
  value       = azurerm_application_security_group.asg.name
}