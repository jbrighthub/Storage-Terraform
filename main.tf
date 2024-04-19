terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.100.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "storage" {
  name     = "myrg"
  location = "Central India"

}

resource "azurerm_storage_account" "storage" {
  name                     = "manishtfstr22"
  resource_group_name      = azurerm_resource_group.storage.name
  location                 = azurerm_resource_group.storage.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "storage" {
    name = "container1"
    storage_account_name = azurerm_storage_account.storage.name
    container_access_type = "blob"
    depends_on = [ azurerm_storage_account.storage ]

}

resource "azurerm_storage_blob" "storage" {
    name = "sample.txt"
    storage_account_name = azurerm_storage_account.storage.name
    type = "Block"
    source = "TO_STUDY.txt"
    storage_container_name = azurerm_storage_container.storage.name
    depends_on = [ azurerm_storage_container.storage ]
  
}
