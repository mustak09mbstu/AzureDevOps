# Common Varaibles Declaration
application = "cop"
environment = "dv"
resource_group_name = "rgp-cop-euw-dv-docker-container-platform"

default_tags = {
  billTo                = "AKS service"
  appName               = "devapp"
  criticalityLevel      = "low"
  downTimeContact       = "mdmustafizur.rahman@bjitgroup.com, mustak09.mbstu@gmail.com"
  environment           = "Development"
  ownerBy               = "mdmustafizur.rahman@bjitgroup.com"
  serviceResponsible    = "mdmustafizur.rahman@bjitgroup.com"
  serviceTime           = "monday-sunday_00:00-23:59"
  supportService        = ""
}


# Storage Account variables Declaration

storage_account_name        = "sta002copeuwdvdevapp" //small letter and digits are allowed in storage account name
account_tier                = "Standard"
account_replication_type    = "LRS"
storagesubnet               = "/subscriptions/f5a56e1a-1f68-4840-a8a9-5cd6124860e1/resourceGroups/rgp-cop-euw-pd-net/providers/Microsoft.Network/virtualNetworks/vnt-cop-euw-pd-container-platform-001/subnets/sub-cop-euw-private-endpoints"
private_endpoint_name_for_storage = "pep-cop-euw-dv-devapp-sta-002"
private_endpoint_service_connection_name_for_storage = "pep-cop-euw-dv-devapp-con-sta-002"

# Application Security Group variables Declaration

# asg_name    = "asg-rgp-cop-euw-devapp-test-docker-container-platform"                   

# Network Security Group variables Declaration

# nsg_name    = "nsg-rgp-cop-euw-devapp-test-docker-container-platform" 

#acr Varaibles Declaration

acr_name                          = "acrcopeuwdvcontainerregistry001"    //Only alphanumeric name is allowed for acr
#skutype                           = "Standard"
skutype                           = "Premium"
acrsubnet                         = "/subscriptions/f5a56e1a-1f68-4840-a8a9-5cd6124860e1/resourceGroups/rgp-cop-euw-pd-net/providers/Microsoft.Network/virtualNetworks/vnt-cop-euw-pd-container-platform-001/subnets/sub-cop-euw-private-endpoints"
private_endpoint_name_for_ACR     = "pep-cop-euw-dv-devapp-acr"
private_endpoint_service_connection_name_for_acr  = "pep-cop-euw-dv-devapp-con-acr"

##SQL Server Varaibles Declaration
sqlsubnetid                       = "/subscriptions/f5a56e1a-1f68-4840-a8a9-5cd6124860e1/resourceGroups/rgp-cop-euw-pd-net/providers/Microsoft.Network/virtualNetworks/vnt-cop-euw-pd-container-platform-001/subnets/sub-cop-euw-private-endpoints"
server_name                       = "sql-cop-euw-dv-devapp"
server_version                    = "12.0"
admin_login_name                  = "devappsqllogin"
admin_password                    = "F@Shak0Rel0R1s!"
database_name                     = "dbdevappdv"
database_collation                = "SQL_LATIN1_GENERAL_CP1_CI_AS"
database_edition                  = "Standard"
database_requested_service_objective_name = "S1"
endpoint_name                     = "pep-cop-euw-dv-sql-devapp"

#Application Gateway Varaibles Declaration
appgatewayname                    = "agw-cop-euw-dv-devapp-001"
subnetappgateway                  = "/subscriptions/f5a56e1a-1f68-4840-a8a9-5cd6124860e1/resourceGroups/rgp-cop-euw-pd-net/providers/Microsoft.Network/virtualNetworks/vnt-cop-euw-pd-container-platform-001/subnets/sub-cop-euw-appgw"
publicipname                      = "appgateway_pip"
privateip                         = "10.100.140.24"
skutier                           = "Standard_v2"

# Aks varaibale Declaration
aks_name                          = "aks-cop-euw-dv-devapp"
dns_prefix                        = "aks-dns-prefix-cop-euw-devapp-dev"
sub_cop_euw_aks_clu               = "/subscriptions/f5a56e1a-1f68-4840-a8a9-5cd6124860e1/resourceGroups/rgp-cop-euw-pd-net/providers/Microsoft.Network/virtualNetworks/vnt-cop-euw-pd-container-platform-001/subnets/sub-cop-euw-aks-clu-dv"
service_pricipal_name             = "aar-cop-euw-pd-container-platform-001"
service_principal_client_id       = "63aeec14-9e26-4061-822b-c70bb538d8c8"
service_principal_client_secret   = "hPp9IIt3lH6~QfpPn7wnP5~rif1Nl2wLxH"
service_principal_object_id       = "50054b52-dbaa-4295-82b6-cca42efdcf1b"
#kubernetes_version                = "1.18.17"
#kubernetes_version                = "1.19.11"
#kubernetes_version                = "1.20.15"
#kubernetes_version                = "1.21.9"
kubernetes_version                = "1.22.6"
aks_node_count                    = "1"
#aks_node_vm_size                  = "Standard_D3_v2"
#aks_node_vm_size                  = "Standard_D8ds_v5"
aks_node_vm_size                  = "Standard_D8ds_v4"
aks_orchestrator_version          = "1.22.6"
aks_node_os_disk_size             = "40"
#aks_node_os_disk_type             = "Ephemeral"

# Namespace variables Declaration
namespace                         = "devappdv"

# User Assigned Identity variable Declaration
identity_name                     = "uai-cop-euw-dv-devapp"

#aadpod variable Declaration
tenantid                          = "65f8dbd7-eb30-4ddc-88b3-f1f6fbea6ba2"

#Agic Variable Declaration
agicname                          = "agic-cop-euw-dv-devapp"
# Log Analytics Workspace
log_analytics_workspace_name = "law-cop-euw-dv-devapp-001"
log_analytics_workspace_location = "westeurope"
log_analytics_workspace_sku = "PerNode"