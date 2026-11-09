output "resource_group_name" {
  description = "Ressursgruppa alle stackene bruker."
  value       = local.resource_group_name
}

output "location" {
  description = "Regionen alt står i."
  value       = var.location
}

output "vnet_name" {
  description = "Navnet på VNet-et."
  value       = local.vnet_name
}
