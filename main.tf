provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgrg-calicot-web-dev" {
  name     = "rg-calicot-web-dev-11"
  location = var.location
}

resource "azurerm_virtual_network" "vnet-dev-calicot-cc" {
  name                = "vnet-dev-calicot-cc-11"
  location            = var.location
  address_space       = [""]
  resource_group_name = azurerm_resource_group.rgrg-calicot-web-dev
}

# REQUIS 1

# REQUIS 2

# REQUIS 3

# REQUIS 4


