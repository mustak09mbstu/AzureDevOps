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


# ACR Variable Declaration
variable "acr_name" {
  description = "Name of the nsg to create"
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