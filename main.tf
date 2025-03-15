terraform {}

provider "azurerm" {
  features {}
}

# EXISTE DÉJÀ
resource "azurerm_resource_group" "rg" {
  name     = "rg-calicot-web-dev-11"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-dev-calicot-cc-11"
  location            = var.location
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "snet" {
  name                 = "snet-dev-web-cc-11"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet" "snet" {
  name                 = "snet-dev-web-cc-11"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

