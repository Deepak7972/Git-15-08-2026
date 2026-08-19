terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg1"
    storage_account_name = "deepakrg17082026"
    container_name       = "backend01"
    key                  = "tfstate"
  }
}

provider "azurerm" {
  features {}
}