provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "${var.name_prefix}-recovery"
  location = var.location
}

resource "azurerm_recovery_services_vault" "main" {
  name                = "${var.name_prefix}-${var.location}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"
}

