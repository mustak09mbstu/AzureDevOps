/*
resource "azurerm_public_ip" "pip" {
  name                = var.publicipname
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}
*/

data "azurerm_public_ip" "pip" {
  name                = "pip-cop-euw-dv-compass-001"
  resource_group_name = var.resource_group_name
}


#&nbsp;since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name                 = "${var.appgatewayname}-beap"
  frontend_port_name                        = "${var.appgatewayname}-feport"
  frontend_public_ip_configuration_name     = "${var.appgatewayname}-public"
  frontend_private_ip_configuration_name    = "${var.appgatewayname}-private"
  http_setting_name                         = "${var.appgatewayname}-be-htst"
  listener_name                             = "${var.appgatewayname}-httplstn"
  request_routing_rule_name                 = "${var.appgatewayname}-rqrt"
  redirect_configuration_name               = "${var.appgatewayname}-rdrcfg"
}

resource "azurerm_application_gateway" "network" {
  name                = var.appgatewayname
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     = var.skutier
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnetappgateway
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }
  frontend_port {
    name = "httpsPort"
    port = 443
    }
  
  frontend_ip_configuration {
    name                 = local.frontend_public_ip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.pip.id
    #public_ip_address_id = azurerm_public_ip.pip.id
  }

 frontend_ip_configuration {
    name                 = local.frontend_private_ip_configuration_name
    subnet_id            = var.subnetappgateway
    private_ip_address_allocation = "Static"
    private_ip_address   = var.privateip
  }


  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }
/*
  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_public_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }
*/
    http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_private_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

  tags                         = var.tags
  #depends_on = [azurerm_public_ip.pip]
}