# Common variables Description

variable "resource_group_name" {
  description = ""
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


# Application Security Group variables Description

variable "asg_name" {
  description = "Name of the asg to create"
  default     = ""
}

# Network Security Group variables Description

variable "nsg_name" {
  description = "Name of the nsg"
  default     = ""
}

# SQL Manage Instance variables

variable "subnet_id" {
  description = "Subnet Id of SQL managed instance"
  default     =""
}