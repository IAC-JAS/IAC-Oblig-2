# Flytt ressursgruppen til shared-network uten å slette den i Azure.
removed {
  from = azurerm_resource_group.this

  lifecycle {
    destroy = false
  }
}

# Flytt VNet-et til shared-network uten å slette det i Azure.
removed {
  from = module.vnet.azurerm_virtual_network.this

  lifecycle {
    destroy = false
  }
}
