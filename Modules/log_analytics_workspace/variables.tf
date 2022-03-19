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
