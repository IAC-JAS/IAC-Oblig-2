# Finn den eksisterende ressursgruppen.
data "azurerm_resource_group" "existing" {
  name = "rg-${var.kortnavn}-oblig2-${var.miljo}"
}

# Finn det eksisterende VNet-et.
data "azurerm_virtual_network" "existing" {
  name                = "vnet-${var.kortnavn}-${var.miljo}"
  resource_group_name = data.azurerm_resource_group.existing.name
}

# Importer ressursgruppen til ny Terraform-state.
import {
  to = azurerm_resource_group.this
  id = data.azurerm_resource_group.existing.id
}

# Importer VNet-et til ny Terraform-state.
import {
  to = module.vnet.azurerm_virtual_network.this
  id = data.azurerm_virtual_network.existing.id
}