/*

Dcumentation:

1. azurerm_log_analytics_workspace - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace

2. azurerm_application_insights - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights

*/

# First we need to create central log analytics workspace
resource "azurerm_log_analytics_workspace" "bsworkspace" {
  name                = "${var.webapp_name}-workspace726652"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_analytics_workspace_retention_in_days
  depends_on          = [azurerm_resource_group.appgrp]
}

# Now we can create application insights resource which is linked to central log analytics workspace
resource "azurerm_application_insights" "bsappinsights" {
  name                = "${var.webapp_name}-appinsights"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_insights_application_type
  workspace_id        = azurerm_log_analytics_workspace.bsworkspace.id
  depends_on          = [azurerm_log_analytics_workspace.bsworkspace]
}
