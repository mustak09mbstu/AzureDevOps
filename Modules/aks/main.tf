resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  #api-server-authorized-ip-ranges = ["172.0.0.10/16", "168.10.0.10/18"] //Authorised Network IP ranges
  tags                = var.tags

  default_node_pool {
    name            = "dvagentpool"   #must start with a lowercase letter, have max length of 12, and only have characters a-z0-9
    node_count      = var.aks_node_count
    vm_size         = var.aks_node_vm_size
    os_disk_size_gb = var.aks_node_os_disk_size
    orchestrator_version = var.aks_orchestrator_version
    #os_disk_type    = var.aks_node_os_disk_type
    os_disk_type     = "Ephemeral"
    #vnet_subnet_id  = var.sub_cop_euw_aks_clu_dv
    vnet_subnet_id  = var.sub_cop_euw_aks_clu
    enable_auto_scaling = true
    max_count = 2
    min_count = 1
  }
  addon_profile{
      oms_agent{
            enabled = true
            #log_analytics_workspace_id = azurerm_log_analytics_workspace.aksterraform.id
            log_analytics_workspace_id = var.log_analytics_workspace_id
        }

      http_application_routing {
        enabled = true
      }

      ingress_application_gateway {
          enabled   	    = true
          gateway_id    	= var.appgatewayid
          #gateway_name	  = var.appgatewayname
        }
      
      azure_policy {
        enabled = true
      }

  }
  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }
  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    #docker_bridge_cidr = "172.17.0.1/16"
    #service_cidr       = "10.0.0.0/16"
    docker_bridge_cidr = "10.107.0.0/17"
    service_cidr       = "10.107.128.0/24"
    dns_service_ip     = "10.107.128.10"
    load_balancer_sku  = "Standard"
  }
  role_based_access_control {
    enabled = true
    
   
    azure_active_directory {
      managed = true
      
      #A list of Object IDs of Azure Active Directory Groups which should have Admin Role on the Cluster.
      admin_group_object_ids = ["76b43c40-20b3-49a7-912c-cc5b5edc486f"]

    }
     /*
    azure_active_directory {
      managed = false
      client_app_id       = "(Required) The Client ID of an Azure Active Directory Application"
      server_app_id       = "(Required) The Server ID of an Azure Active Directory Application"
      server_app_secret   = "(Required) The Server Secret of an Azure Active Directory Application"
      tenant_id           = "(Required) Azure Active Directory tenant Id"
    }
*/

  }
  #depends_on = [azurerm_log_analytics_workspace.aksterraform, azurerm_log_analytics_solution.aksterraformsolution]
}
