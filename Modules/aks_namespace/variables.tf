variable "resource_group_name" {
  description = ""
  default     = ""
}

variable "aksname" {
  description = "aks name pass to helm"
  default     = ""
}

variable "service_principal_client_id" {
  description = "The app id of the service principal to be used by AKS"
  default     = ""
}

variable "service_principal_client_secret" {
  description = "The client secret of the service principal to be used by AKS"
  default     = ""
}

variable "namespace" {
  description = "aks name space"
  default     = ""
}

variable "tenantid" {
  description = "tenant ID for login"
  default     = ""
}