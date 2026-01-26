resource "azurerm_resource_group" "network" {
  name     = "rg-prod-eastus-network"
  location = var.location
}

module "network" {
  source              = "../../modules/network"
  resource_group_name = azurerm_resource_group.network.name
  location            = var.location
  vnet_name           = "vnet-qa-eastus-core"
  address_space       = "10.30.0.0/16"

  subnets = {
    "snet-qa-web" = "10.30.1.0/24"
    "snet-qa-app" = "10.30.2.0/24"
    "snet-qa-db"  = "10.30.3.0/24"
  }
}
