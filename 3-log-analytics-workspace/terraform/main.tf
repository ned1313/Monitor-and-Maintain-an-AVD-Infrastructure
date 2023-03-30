provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "${var.naming_prefix}-insights"
  location = var.location
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "${var.naming_prefix}-insights"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku = var.sku_name
  retention_in_days   = var.retention_in_days
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.main.id
}
