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

# User Assigned Identity variables Description
variable "identity_name" {
  description = "Name of the user asserted identity"
  default     = ""
}

variable "service_principal_object_id" {
  description = "The client object id of the service principal to be used by AKS"
  default     = ""
}

variable "appgatewayid" {
  description = "gatewayid for role assignment from UserIdentity"
  default     = ""
}