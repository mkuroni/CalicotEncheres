terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

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

resource "azurerm_service_plan" "plan" {
  name                = "plan-calicot-dev-11"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "S1"


  maximum_elastic_worker_count = 2
  app_service_environment_id   = null
}
resource "azurerm_windows_web_app" "app" {
  name                = "app-calicot-dev-11"
  location            = "Canada Central"
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id
  https_only          = false


  app_settings = {
    "ImageUrl" = "https://stcalicotprod000.blob.core.windows.net/images/"
  }

  site_config {

  }

  identity {
    type = "SystemAssigned"
  }
}