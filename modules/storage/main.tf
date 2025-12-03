resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

resource "azurerm_storage_account" "sa" {
  name                     = "${var.storage_name_prefix}${random_integer.rand.result}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"  # CHANGED FROM 'kind' to 'account_kind'

  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }
}

resource "azurerm_storage_blob" "index" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = var.index_html_path
  content_type           = "text/html"
}

resource "azurerm_storage_blob" "error" {
  name                   = "404.html"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = var.error_html_path
  content_type           = "text/html"
}