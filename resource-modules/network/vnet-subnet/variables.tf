##########################################
# Setting up resource variables for Subnet
##########################################

#common

variable "resource_group" {
  description = "Resource Group of vNet"
  type        = string
}

#subnet

variable "vnet_name" {
  description = "The name of the virtual network to which to attach the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet. Changing this forces a new resource to be created."
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = string
}

variable "route_table_id" {
  description = "The ID of the Route Table to associate with the subnet."
  type        = string
  default     = ""
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group to associate with the subnet."
  type        = string
  default     = ""
}

variable "subnet_service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql and Microsoft.Storage."
  type        = list
  default     = []
}