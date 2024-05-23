# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "resources98" {
  name     = "resources98"
  location = "West Europe"

  tags = {
    "env" = "dev"
  }
}


data "azuread_user" "newuser" {
  user_principal_name = "ahmed@itexpertnow.com"
}


resource "azuread_group" "grp" {
  display_name     = "silvergrp"
  security_enabled = true
}

resource "azuread_group_member" "silver" {
  group_object_id  = azuread_group.grp.id
  member_object_id = data.azuread_user.newuser.id
}