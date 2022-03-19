variable "resource_group_name" {
  description = "Name of the resource group"
  default = ""
 }

 variable "location" {
  description = "Location of the Resource Group"
  default = ""
 }

 variable "storage_account_name" {
  description = "Storage account name"
  default = ""
  }

variable "account_tier" {
  description = "Storage account tier"
  default = ""
  }


variable "account_replication_type" {
  description = "Storage replication type"
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

  variable "tags" {
  description = "Tags to associate the resource"
  type        = map(string)
  default     = {}
}