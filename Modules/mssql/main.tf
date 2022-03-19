resource "azurerm_sql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.admin_login_name
  administrator_login_password = var.admin_password
  tags                         = var.tags
}

resource "azurerm_sql_database" "sql_database" {
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
  name                = var.database_name

  collation                        = var.database_collation
  edition                          = var.database_edition
  requested_service_objective_name = var.database_requested_service_objective_name
}


resource "azurerm_sql_firewall_rule" "dbrule1" {
  name                = "FirewallRule1"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
/*
resource "azurerm_private_endpoint" "sql_server_endpoint" {
  name                = var.endpoint_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.sqlsubnetid

  private_service_connection {
    name                           = "${var.endpoint_name}private"
    private_connection_resource_id = azurerm_sql_server.sql_server.id
    subresource_names              = [ "sqlServer" ]
    is_manual_connection           = false
  }
  depends_on = [ azurerm_sql_database.sql_database ]
}

*/