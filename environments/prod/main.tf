resource "azurerm_resource_group" "network" {
  name     = "rg-qa-eastus-network"
  location = var.location
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.network.name
  location            = var.location
  vnet_name           = "vnet-prod-eastus-core"
  address_space       = "10.20.0.0/16"

  subnets = {
    "snet-prod-web" = "10.20.1.0/24"
    "snet-prod-app" = "10.20.2.0/24"
    "snet-prod-db"  = "10.20.3.0/24"
  }
}
