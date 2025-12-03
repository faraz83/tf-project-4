output "static_endpoint" {
  value = azurerm_storage_account.sa.primary_web_endpoint
}

output "storage_name" {
  value = azurerm_storage_account.sa.name
}