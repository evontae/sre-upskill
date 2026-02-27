terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name  = "rg-${var.resource_prefix}-learning"
  location = var.location
}

resource "azurerm_virtual_network" "main" {
    name = "vnet-${var.resource_prefix}-learning"
    location = var.location
    resource_group_name = azurerm_resource_group.main.name
    address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "main" {
  name = "snet-${var.resource_prefix}-learning"
  resource_group_name = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = ["10.0.1.0/24"]
}