terraform {
    backend "azurerm" {
	}
    required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.60.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}

/*
module "key_vault" {
  source = "../Modules/keyvault"
}

*/

# Storage Account Creation

module "storage_account" {
  source = "../Modules/storage"
  resource_group_name                               = data.azurerm_resource_group.rg.name
  location                                          = data.azurerm_resource_group.rg.location
  storage_account_name                              = var.storage_account_name
  account_tier                                      = var.account_tier
  account_replication_type                          = var.account_replication_type
  private_endpoint_name_for_storage                 = var.private_endpoint_name_for_storage
  private_endpoint_service_connection_name_for_storage = var.private_endpoint_service_connection_name_for_storage
  storagesubnet                                     = var.storagesubnet
  tags                                              = var.default_tags
}





# ACR Creation
module "azure_container_registry" {
  source = "../Modules/acr"
  resource_group_name       = data.azurerm_resource_group.rg.name
  location                  = data.azurerm_resource_group.rg.location
  acr_name                  = var.acr_name
  skutype                   = var.skutype
  acrsubnet                 = var.acrsubnet
  private_endpoint_name_for_ACR = var.private_endpoint_name_for_ACR
  private_endpoint_service_connection_name_for_acr = var.private_endpoint_service_connection_name_for_acr
  tags                      = var.default_tags
}

/*
# SQL Creation


module "azure_sql_server" {
  source = "../Modules/mssql"
  resource_group_name       = data.azurerm_resource_group.rg.name
  location                  = data.azurerm_resource_group.rg.location
  sqlsubnetid               = var.sqlsubnetid
  server_name               = var.server_name
  server_version            = var.server_version
  #admin_login_name          = var.admin_login_name
  #admin_password            = var.admin_password
  admin_login_name          = module.key_vault.dbusername
  admin_password            = module.key_vault.dbpassword
  database_name             = var.database_name
  database_collation        = var.database_collation
  database_edition          = var.database_edition
  database_requested_service_objective_name = var.database_requested_service_objective_name
  #endpoint_name             = var.endpoint_name
  tags                      = var.default_tags
  depends_on = [ module.key_vault ]
}

*/

# Application Gateway Creation
module "appgateway" {
  source                    = "../Modules/appgateway"
  appgatewayname            = var.appgatewayname
  resource_group_name 	    = data.azurerm_resource_group.rg.name
  location                  = data.azurerm_resource_group.rg.location
  subnetappgateway      	  = var.subnetappgateway
  publicipname              = var.publicipname
  privateip                 = var.privateip
  skutier                   = var.skutier
  tags                      = var.default_tags
}

# Log analytics workspace
module "log_analytics_workspace" {
  source                          = "../Modules/log_analytics_workspace"
  resource_group_name             = data.azurerm_resource_group.rg.name
  location                        = data.azurerm_resource_group.rg.location
  tags                            = var.default_tags
}

# Azure Kubernetes cluster Creation
module "aks" {
  source                          = "../Modules/aks"
  aks_name                        = var.aks_name
  dns_prefix                      = var.dns_prefix
  resource_group_name             = data.azurerm_resource_group.rg.name
  location                        = data.azurerm_resource_group.rg.location
  kubernetes_version              = var.kubernetes_version
  service_principal_client_id     = var.service_principal_client_id
  service_principal_client_secret = var.service_principal_client_secret
  aks_node_count				          = var.aks_node_count
  aks_node_vm_size				        = var.aks_node_vm_size
  aks_orchestrator_version        = var.aks_orchestrator_version
  aks_node_os_disk_size			      = var.aks_node_os_disk_size
  service_principal_object_id     = var.service_principal_object_id
  sub_cop_euw_aks_clu             = var.sub_cop_euw_aks_clu
  appgatewayid                    = module.appgateway.appgatewayid
  log_analytics_workspace_id      = module.log_analytics_workspace.log_analytics_workspace_id
  #appgatewayname                 = var.appgatewayname
  tags                            = var.default_tags
  depends_on                     = [ module.appgateway ]
}

# Namespace creation in AKS
module "aksnamespace" {
  source = "../Modules/aks_namespace"
  resource_group_name = data.azurerm_resource_group.rg.name
  aksname = var.aks_name
  service_principal_client_id     = var.service_principal_client_id
  service_principal_client_secret = var.service_principal_client_secret
  namespace                       = var.namespace
  tenantid                        = var.tenantid
  depends_on = [ module.aks ]
}
/*

# User Assigned Identity Creation
module "user_assigned_identity" {
  source                          = "../Modules/user_assigned_identity"
  resource_group_name             = data.azurerm_resource_group.rg.name
  location                        = data.azurerm_resource_group.rg.location
  identity_name                   = var.identity_name
  service_principal_object_id     = var.service_principal_object_id
  appgatewayid                    = module.appgateway.appgatewayid
  tags                            = var.default_tags
  depends_on                      = [ module.appgateway ]
  
}


module "adpod" {
  source                          = "../Modules/aadpod"
  resource_group_name             = data.azurerm_resource_group.rg.name
  aksname                         = module.aks.aks_name
  service_principal_client_id     = var.service_principal_client_id
  service_principal_client_secret = var.service_principal_client_secret
  tenantid                        = var.tenantid
  depends_on                      = [ module.appgateway, module.user_assigned_identity ]
}

provider "kubernetes" {
  host                            = module.aks.aks_host
    client_certificate            = base64decode(module.aks.aks_client_certificate)
    client_key                    = base64decode(module.aks.aks_client_key)
    cluster_ca_certificate        = base64decode(module.aks.aks_cluster_ca_certificate) 
}

provider "helm" {
  kubernetes {
    host                          = module.aks.aks_host
    client_certificate            = base64decode(module.aks.aks_client_certificate)
    client_key                    = base64decode(module.aks.aks_client_key)
    cluster_ca_certificate        = base64decode(module.aks.aks_cluster_ca_certificate) 
  }
}

module "agic" {
  source                          = "../Modules/agic"
  resource_group_name             = data.azurerm_resource_group.rg.name
  appgatewayname                  = module.appgateway.applicationgateway
  #useridentityname = module.user_assigned_identity.identity_name
  useridentityid                  = module.user_assigned_identity.identity_id
  useridentityclientid            = module.user_assigned_identity.identity_client_id
  aksfqdn                         = module.aks.aks_fqdn
  namespace                       = var.namespace
  agicname                        = var.agicname
  providers                       = { kubernetes = kubernetes, helm = helm }
  depends_on                      = [ module.adpod, module.aks, module.aksnamespace ]
}
*/
