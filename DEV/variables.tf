# Common variables Description

variable "resource_group_name" {
  description = "Resource Group name"
  default     = ""
}

variable "location" {
  description = ""
  default     = ""
}

variable "application" {
  description = "Application Name"
  default = ""
  }

variable "environment" {
  description = "Environment Name"
  default = ""
  }
variable "default_tags" {
  description = ""
  type        = map(string)
  default     = {}
}

  variable "tags" {
  description = "The tags to associate the resource we are creating"
  type        = map(string)
  default     = {}
}

  # Storage Account variables Description

  variable "storage_account_name" {
  description = "The storage account name"
  default = ""
  }

variable "account_tier" {
  description = "The storage account tier"
  default = ""
  }


variable "account_replication_type" {
  description = "The storage replication type"
  default = ""
  }

  variable "private_endpoint_name_for_storage" {
  description = "Name of Private End Point for Storage account"
  default = ""
  }

  variable "private_endpoint_service_connection_name_for_storage" {
  description = "Service Connection Name for Private End Point"
  default = ""
  }

  variable "storagesubnet" {
  description = "Private End Point Subnet for storage"
  default = ""
  }

# ACR Variable Description
variable "acr_name" {
  description = "Name of the ACR to create"
  default     = ""
}

variable "skutype" {
  description = "sku type for ACR"
  default     = ""
}

variable "acrsubnet" {
  description = "Private End Point Subnet for Acr"
  default     = ""
}

variable "private_endpoint_name_for_ACR" {
  description = " Private End point name for ACR"
  default     = ""
}

variable "private_endpoint_service_connection_name_for_acr" {
  description = "Private End Point Service Connection name"
  default     = ""
}

# SQL server variables Description
variable "sqlsubnetid" {
  description = "For Private Endpoint to SQL"
  default     = ""
}

variable "server_name" {
  default     = ""
  description = "Name of the server. "
}

variable "server_version" {
  default     = ""
  description = "Version of the server. "
}

variable "admin_login_name" {
  default     = ""
  description = "The Administrator Login for the SQL Server. Changing this forces a new resource to be created."
}

variable "admin_password" {
  default     = ""
  description = "The Password associated with the administrator_login for the SQL Server."
}


# SQL database variables Description
variable "database_name" {
  default     = ""
  description = "Name on the initial database on the server. "
}

variable "database_collation" {
  default = ""
  description = "Which collation the initial database should have."
}

variable "database_edition" {
  default = ""
  description = "Which database scaling edition the database should have."
}

variable "database_requested_service_objective_name" {
  default = ""
  description = "Which service scaling objective the database should have."
}

variable "endpoint_name" {
  default = ""
  description = "Database endpint name."
}
variable "start_ip_address" {
  default = ""
  description = "Allow Azure services to access sql database"
}
variable "end_ip_address" {
  default = ""
  description = "Allow Azure services to access sql database"
}
# Application Gateway variables Description

variable "appgatewayname" {
  default = ""
  description = "Appgateway Name"
}

variable "subnetappgateway" {
  default = ""
  description = "Appgateway Subnet Name" 
}

variable "publicipname" {
  default = ""
  description = "Public IP name" 
}

variable "privateip" {
  default = ""
  description = "Private IP For Application Gateway" 
}

variable "skutier" {
  default = ""
  description = "Sku Tier for Application Gateway" 
}

# aks variables Description

variable "aks_name" {
  description = "Name of the aks"
  default     = ""
}

variable "dns_prefix" {
  description = "Name of the dns_prefix"
  default     = ""
}

variable "sub_cop_euw_aks_clu" {
  description = "Dev aks Subnet ID"
  default     = ""
}

variable "kubernetes_version" {
  description = "Kubernetes version to use"
  default     = ""
}
variable "service_pricipal_name" {
  description = "The name of service principal to be used by AKS"
  default     = ""
}

variable "service_principal_client_id" {
  description = "The client id of the service principal to be used by AKS"
  default     = ""
}

variable "service_principal_client_secret" {
  description = "The client secret of the service principal to be used by AKS"
}

variable "service_principal_object_id" {
  description = "The client id of the service principal to be used by AKS"
  default     = ""
}

variable "aks_node_count" {
  description = "Node for aks cluster"
  default     = ""
}

variable "aks_node_vm_size" {
  description = "Vm Size Definition like (Standard V2) for aks cluster"
  default     = ""
}

variable "aks_orchestrator_version" {
  description = "Node pool version"
  default     = ""
}

variable "aks_node_os_disk_size" {
  description = "Vm Disk Size of the aks nodes"
  default     = ""
}
variable "aks_node_os_disk_type" {
  description = "AKS node OS type"
  default     = ""
}

#Namespace variable Description

variable "namespace" {
  description = "AKS namespace"
  default     = ""
}
# User Assigned Identity variables Description
variable "identity_name" {
  description = "Name of the user asserted identity"
  default     = ""
}

/*
variable "appgatewayid" {
  description = "gatewayid for role assignment from UserIdentity"
  default     = ""
}
*/
# AADPod variables Description
variable "aksname" {
  description = "aks name pass to helm"
  default     = ""
}

variable "tenantid" {
  description = "tenant ID for login"
  default     = ""
}

#AGIC Variables Declaration
 variable "useridentityid" {
  description = "userasserted identity passed to helm agic node"
  default     = ""
}

variable "useridentityclientid" {
  description = "userasserted client id passed to helm agic node"
  default     = ""
}

variable "configpath" {
  description = "aks clustser config path pass to helm"
  default     = ""
}

variable "aksfqdn" {
  description = "aks clustser fqdn pass to helm"
  default     = ""
}

variable "agicname" {
  description = "agic name which will deploy through helm"
  default     = ""
}

# Log analytics workspace 
variable "log_analytics_workspace_name" {
  description = "Log analytics workspace name"
  default     = ""
}
variable "log_analytics_workspace_location" {
  description = "Log analytics workspace location"
  default     = ""
}
variable "log_analytics_workspace_sku" {
  description = "Log analytics workspace sku"
  default     = ""
}