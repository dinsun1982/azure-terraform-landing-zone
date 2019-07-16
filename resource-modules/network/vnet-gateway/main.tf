###########################
# Setting up resource group
###########################

data "azurerm_resource_group" "base" {
  name = var.resource_group
}

######################################
# Setting up Public IP for VPN Gateway
######################################

resource "azurerm_public_ip" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}-ip"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name
  allocation_method   = var.ip_allocation
}

#################################
# Setting up VPN Gateway Resource
#################################

resource "azurerm_virtual_network_gateway" "base" {
  name                = "${data.azurerm_resource_group.base.name}-${var.resource_prefix}"
  location            = data.azurerm_resource_group.base.location
  resource_group_name = data.azurerm_resource_group.base.name

  type     = var.gateway_type
  vpn_type = var.vpn_type

  sku = var.sku

  ip_configuration {
    name                          = azurerm_public_ip.base.name
    public_ip_address_id          = azurerm_public_ip.base.id
    private_ip_address_allocation = var.ip_allocation
    subnet_id                     = var.gateway_subnet
  }

  ###############################
  # Setting up vpn p2s connection
  ###############################

  vpn_client_configuration {
    address_space        = var.client_address_spaces
    vpn_client_protocols = var.vpn_client_protocols

    /*  root_certificate {
      name = "Self-signed-P2S-KV-cert"

      public_cert_data = base64encode(var.certificate_data)
    }*/
  }
  tags = var.tags
}

