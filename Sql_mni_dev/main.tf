terraform {
  backend "azurerm" {
	}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}

  subscription_id = "f5a56e1a-1f68-4840-a8a9-5cd6124860e1"
}

data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}

# SQL Manage instance
module "sql_mni" {
  source = "../Modules/sql_managed_instance"
  resource_group_name                               = data.azurerm_resource_group.rg.name
  location                                          = data.azurerm_resource_group.rg.location
  subnet_id                                         = var.subnet_id
  tags                                              = var.default_tags
}