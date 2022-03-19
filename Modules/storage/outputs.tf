
output "storage_account_name" {
  value = azurerm_storage_account.sta.name
}

output "account_tier" {
  value = azurerm_storage_account.sta.account_tier
}

output "account_replication_type" {
  value = azurerm_storage_account.sta.account_replication_type
}

output "private_endpoint" {
  value = azurerm_private_endpoint.PrivateEndPointStorage.name
}
