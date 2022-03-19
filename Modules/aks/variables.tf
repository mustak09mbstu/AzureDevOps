variable "resource_group_name" {
  description = "Name of the resource group"
  default = ""
 }

 variable "location" {
  description = "Location of the Resource Group"
  default = ""
 }

variable "tags" {
  description = "The tags to associate the resource"
  type        = map(string)
  default     = {}
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

# AKS variables Description

variable "aks_name" {
  description = "Name of the aks"
  default     = ""
}

variable "dns_prefix" {
  description = "Name of the dns_prefix"
  default     = ""
}

variable "kubernetes_version" {
  description = "Kubernetes version to use"
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


variable "sub_cop_euw_aks_clu" {
  description = "Aks Subnet"
  default     = ""
}

variable "aks_node_os_disk_type" {
  description = "Aks node os disk type"
  default     = ""
}

variable "appgatewayid" {
  description = "Application gateway id"
}

variable "log_analytics_workspace_id" {
  description = "log analytics workspace id"
  default     = ""
}
