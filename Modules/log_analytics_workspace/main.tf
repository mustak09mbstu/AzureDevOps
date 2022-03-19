#Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "aksterraform" {
    name                = "compassloganalytics-001"
    location            = var.location
    resource_group_name = var.resource_group_name
    sku                 = "PerNode"
    tags                = var.tags
}


#Enable Log Analytics Solution
resource "azurerm_log_analytics_solution" "aksterraformsolution" {
    solution_name         = "ContainerInsights"
    location              = var.location
    resource_group_name   = var.resource_group_name
    workspace_resource_id = azurerm_log_analytics_workspace.aksterraform.id
    workspace_name        = azurerm_log_analytics_workspace.aksterraform.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
depends_on = [azurerm_log_analytics_workspace.aksterraform]    
}