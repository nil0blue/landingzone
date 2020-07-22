variable "client_secret" {}
variable "subscription_id" {}

variable "region" {
  type = string
}



provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "~>2.0"
  features {}
  
  client_id     = "a0947a78-88f3-46f2-a166-d8cbf7aa3b88"
  client_secret = var.client_secret
  tenant_id     = "14841bc0-087f-44e4-978e-21deaf99be5d"
  subscription_id = var.subscription_id
}

variable "vnets-map" {
  type = map(object({
    name  = string
    address_space = list(string)
    subnets-map = map(object({
      subnet_name  = string
      subnet_address_space = list(string)
    }))
  }))
}


resource "azurerm_resource_group" "rg_foundation" {
  for_each = var.vnets-map 

  name     = "RG_${each.value.name}"
  location = var.region
}



locals {
 subnet-list =  flatten([
    for vnet, vnet_data in var.vnets-map : [
      for subnet_data in vnet_data.subnets-map : {
        "${vnet}-${subnet_data.subnet_name}" = {
          "subnet_name" = subnet_data.subnet_name
          "vnet_name" = vnet_data.name
          "subnet_address_space" = subnet_data.subnet_address_space
          }
      }
    ]
 ])

 subnet-map = { for item in local.subnet-list: 
     keys(item)[0] => values(item)[0]
   }
}


resource "azurerm_virtual_network" "vnets_foundation" {
  for_each = var.vnets-map

  name     = each.value.name
  resource_group_name = "RG_${each.value.name}"
  location = var.region
  #dns_servers = var.each.value.dns_servers
  address_space = each.value.address_space

  depends_on = [
    azurerm_resource_group.rg_foundation,
  ]
}

resource "azurerm_subnet" "subnets_foundation" {
  for_each = local.subnet-map

  name                 = each.value.subnet_name
  resource_group_name  = "RG_${each.value.vnet_name}"
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.subnet_address_space

  depends_on = [
    azurerm_virtual_network.vnets_foundation,
  ]
}

output "subnet-map" {
   value = local.subnet-map
}

