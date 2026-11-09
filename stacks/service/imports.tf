
# Hent ID-en til den eksisterende ressursgruppen.
# Shared-network eier denne ressursen.
data "azurerm_resource_group" "existing" {
  name = local.network.resource_group_name
}

locals {
  import_rg_id     = data.azurerm_resource_group.existing.id
  import_subnet_id = "${local.network.vnet_id}/subnets/snet-${var.service}"
  import_nsg_id    = "${local.import_rg_id}/providers/Microsoft.Network/networkSecurityGroups/nsg-${var.service}"

  # Aktiver bare importene for riktig runtime.
  vm_imports     = var.runtime == "vm" ? toset([var.service]) : toset([])
  webapp_imports = var.runtime == "webapp" ? toset([var.service]) : toset([])
}

# ---------------------------------------------------
# Nettverk: 4 ressurser per tjeneste
# ---------------------------------------------------

import {
  to = module.subnet.azurerm_subnet.this
  id = local.import_subnet_id
}

import {
  to = module.subnet.azurerm_network_security_group.this
  id = local.import_nsg_id
}

import {
  to = module.subnet.azurerm_network_security_rule.http
  id = "${local.import_nsg_id}/securityRules/allow-http"
}

import {
  to = module.subnet.azurerm_subnet_network_security_group_association.this
  id = local.import_subnet_id
}

# ---------------------------------------------------
# Data: 2 ressurser per tjeneste
# ---------------------------------------------------

import {
  to = module.storage.azurerm_storage_account.this
  id = "${local.import_rg_id}/providers/Microsoft.Storage/storageAccounts/st${var.kortnavn}${var.service}${var.miljo}"
}

import {
  to = module.keyvault.azurerm_key_vault.this
  id = "${local.import_rg_id}/providers/Microsoft.KeyVault/vaults/kv-${var.kortnavn}-${var.service}-${var.miljo}"
}

# ---------------------------------------------------
# VM: 3 ressurser, bare for runtime = "vm"
# ---------------------------------------------------

import {
  for_each = local.vm_imports

  to = module.vm[each.value].azurerm_public_ip.this
  id = "${local.import_rg_id}/providers/Microsoft.Network/publicIPAddresses/pip-${each.value}"
}

import {
  for_each = local.vm_imports

  to = module.vm[each.value].azurerm_network_interface.this
  id = "${local.import_rg_id}/providers/Microsoft.Network/networkInterfaces/nic-${each.value}"
}

import {
  for_each = local.vm_imports

  to = module.vm[each.value].azurerm_linux_virtual_machine.this
  id = "${local.import_rg_id}/providers/Microsoft.Compute/virtualMachines/vm-${each.value}"
}

# ---------------------------------------------------
# Webapp: 2 ressurser, bare for runtime = "webapp"
# ---------------------------------------------------

import {
  for_each = local.webapp_imports

  to = module.webapp[each.value].azurerm_service_plan.this
  id = "${local.import_rg_id}/providers/Microsoft.Web/serverFarms/asp-${each.value}"
}

import {
  for_each = local.webapp_imports

  to = module.webapp[each.value].azurerm_linux_web_app.this
  id = "${local.import_rg_id}/providers/Microsoft.Web/sites/app-${var.kortnavn}-${each.value}-${var.miljo}"
}
