output "azurerm_storage_account_name" {
  value = azurerm_storage_account.storage.name
}
output "azurerm_storage_account_type" {
  value = azurerm_storage_account.storage.account_tier
}
