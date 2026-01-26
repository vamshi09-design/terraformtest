terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstate001oplk"
    container_name       = "tfstate"
    key                  = "dev/network.tfstate"
  }
}
