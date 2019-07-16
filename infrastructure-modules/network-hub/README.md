
# Module `.`

## Input Variables
* `environment` (required): Development environment for resource; prod, non-prod, shared-services
* `nsg_rules_dmz` (required): List of NSG rules
* `region` (required): Geographic Region resource will be deployed into
* `subnet_dmz_address_prefix` (required): The address prefix to use for the subnet.
* `tags` (required): A map of tags to add to all resources
* `vnet_address_ranges` (required): This is a list of the ip address ranges for the vnet

## Output Values
* `subnet_dmz_id`: resource id for dmz subnet
* `subnet_dmz_name`: resource name for dmz subnet
* `vnet_hub_id`: resource id of vnet hub
* `vnet_hub_name`: resource name of vnet hub
* `vnet_hub_rg`: resource group name of vnet hub

## Child Modules
* `nsg_association_dmz` from `../../resource-modules/network/nsg-association`
* `nsg_dmz` from `../../resource-modules/network/nsg`
* `resource_group` from `../../resource-modules/resource-group`
* `subnet_dmz` from `../../resource-modules/network/vnet-subnet`
* `vnet_hub` from `../../resource-modules/network/vnet`

