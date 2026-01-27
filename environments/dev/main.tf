resource "azurerm_resource_group" "network" {
  name     = "rg-dev-eastus-network"
  location = var.location
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.network.name
  location            = var.location
  vnet_name           = "vnet-dev-eastus-core"
  address_space       = "10.10.0.0/16"

  subnets = {
    "snet-dev-web" = "10.10.1.0/24"
    "snet-dev-app" = "10.10.2.0/24"
    "snet-dev-db"  = "10.10.3.0/24"
    "snet-dev-db-09" = "10.10.4.0/24"
  }
}
