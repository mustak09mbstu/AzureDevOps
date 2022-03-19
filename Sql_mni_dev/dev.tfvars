# Common Varaibles Declaration
application = "cop"
environment = "dev"
resource_group_name = "rgp-cop-euw-dv-docker-container-platform"

default_tags = {
  billTo                = "115L0033"
  appName               = "Docker-Container-Platform"
  criticalityLevel      = "C1"
  downTimeContact       = "mdmustafizur.rahman@bjitgroup.com"
  environment           = "dv"
  ownerBy               = "mdmustafizur.rahman@bjitgroup.com"
  serviceResponsible    = "IT"
  serviceTime           = "monday-sunday_00:00-23:59"
  supportService        = "IT"
}

# SQL Managed Instance
subnet_id = "/subscriptions/f5a56e1a-1f68-4840-a8a9-5cd6124860e1/resourceGroups/rgp-cop-euw-pd-net/providers/Microsoft.Network/virtualNetworks/vnt-cop-euw-pd-container-platform-001/subnets/sub-cop-euw-sql-dv"
nmi_subnet_name = "sub-cop-euw-sql-dv"