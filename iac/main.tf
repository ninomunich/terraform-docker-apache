terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.93.0"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "terraform_gp" {
  name     = "terraform_gp"
  location = "eastus"
}
