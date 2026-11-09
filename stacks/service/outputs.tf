output "subnet_id" {
  description = "Azure-ID for tjenestens subnett."
  value       = module.subnet.subnet_id
}

output "storage_account_name" {
  description = "Navnet pa tjenestens storage account."
  value       = module.storage.name
}

output "key_vault_name" {
  description = "Navnet pa tjenestens Key Vault."
  value       = module.keyvault.name
}

output "vm_public_ip" {
  description = "Offentlig IP for VM-tjenester, ellers null."
  value       = var.runtime == "vm" ? module.vm[var.service].public_ip : null
}

output "webapp_hostname" {
  description = "Vertsnavn for webapp-tjenester, ellers null."
  value       = var.runtime == "webapp" ? module.webapp[var.service].hostname : null
}