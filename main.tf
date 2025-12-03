provider "azurerm" {
  features {}
    subscription_id = "85808489-9b0d-4fe5-b221-963f699da40d" 
}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

module "storage" {
  source = "./modules/storage"
  
  location            = var.location
  rg_name            = azurerm_resource_group.rg.name
  storage_name_prefix = var.storage_prefix
  index_html_path    = "website/index.html"
  error_html_path    = "website/404.html"
}
