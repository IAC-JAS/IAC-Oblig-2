output "resource_group_name" {
  description = "Navnet på den delte ressursgruppen."
  value       = azurerm_resource_group.this.name
}

output "location" {
  description = "Azure-regionen til ressursgruppen."
  value       = azurerm_resource_group.this.location
}

output "vnet_name" {
  description = "Navnet på det delte virtuelle nettverket."
  value       = module.vnet.name
}

output "vnet_id" {
  description = "Azure-ID-en til det delte virtuelle nettverket."
  value       = module.vnet.id
}