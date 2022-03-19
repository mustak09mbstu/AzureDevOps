variable "resource_group_name" {
  description = "Name of the resource group"
  default = ""
 }

 #AGIC variables Declaration

 variable "appgatewayname" {
  default = ""
  description = "Appgateway Name"
}

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

variable "namespace" {
  description = "AKS namespace"
  default     = ""
}

variable "agicname" {
  description = "agic name which will deploy through helm"
  default     = ""
}