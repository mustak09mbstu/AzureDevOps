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