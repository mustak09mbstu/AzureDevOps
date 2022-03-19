variable "resource_group_name" {
  description = ""
  default     = ""
}

variable "location" {
  description = ""
  default     = ""
}

variable "tags" {
  description = "The tags to associate the resource"
  type        = map(string)
  default     = {}
}

# SQL Server variables Description
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

# SQL Database variables Description

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
  description = "Database endpoint name."
}

variable "start_ip_address" {
  default = ""
  description = "Allow Azure services to access sql database"
}
variable "end_ip_address" {
  default = ""
  description = "Allow Azure services to access sql database"
}
# SQL Manage instance variables

variable "sql_mni_name" {
  default = ""
  description = "SQL Manage instance"
}
variable "subnet_id" {
  default = ""
  description = "SQL Manage instance subnet id"
}

variable "nmi_subnet_name" {
    default = ""
    description = "SQL nami subnet name"
}
