###########################
# Setting up resource group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

################
# Setting up NSG
################

resource "azurerm_network_security_group" "base" {
  count               = length(var.subnet_names)
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}-${element(var.subnet_names, count.index)}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
}

######################
# Setting up NSG Rules
######################

resource "azurerm_network_security_rule" "base" {
  count                       = length(var.nsg_rules)
  name                        = var.nsg_rules[count.index]["name"]
  priority                    = var.nsg_rules[count.index]["priority"]
  direction                   = var.nsg_rules[count.index]["direction"]
  access                      = var.nsg_rules[count.index]["access"]
  protocol                    = var.nsg_rules[count.index]["protocol"]
  source_port_range           = var.nsg_rules[count.index]["source_port_range"]
  destination_port_range      = var.nsg_rules[count.index]["destination_port_range"]
  source_address_prefix       = var.nsg_rules[count.index]["source_address_prefix"]
  destination_address_prefix  = var.nsg_rules[count.index]["destination_address_prefix"]
  resource_group_name         = data.azurerm_resource_group.base.name
  network_security_group_name = "${element("${azurerm_network_security_group.base.*.name}", count.index)}"
}