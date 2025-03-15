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

# REQUIS 1

# REQUIS 2

# REQUIS 3

# REQUIS 4


