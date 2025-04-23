terraform {
  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = "0.11.43"
    }
    azurerm = {
      version = "3.11.0"
    }
  }

  backend "azurerm" {
    # Azure Storage Account Details
    resource_group_name  = "lulu_resourcegroup"
    storage_account_name = "luluwa"
    # No need to change these values:
    container_name = "terraform-git-actions"
    key            = "terraform.tfstate"
  }
}

provider "volterra" {
  url          = local.api_url
  api_p12_file = var.api_p12_file
}

provider "azurerm" {
  features {}
}