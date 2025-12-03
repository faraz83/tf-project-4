terraform {
  backend "azurerm" {
    resource_group_name  = "tf-backend-rg"
    storage_account_name = "tfstate21033"
    container_name       = "tfstate"
    key                  = "tf-project-4.terraform.tfstate"
  }
}