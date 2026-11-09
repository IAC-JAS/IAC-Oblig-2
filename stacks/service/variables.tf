variable "kortnavn" {
  description = "Kortnavn brukt i Azure-ressursnavn."
  type        = string
}

variable "location" {
  description = "Azure-regionen ressursene ligger i."
  type        = string
}

variable "miljo" {
  description = "Miljoet, enten dev eller prod."
  type        = string
}

variable "state_resource_group_name" {
  description = "Ressursgruppen til Terraform-backend."
  type        = string
}

variable "state_storage_account_name" {
  description = "Storage account for Terraform-state."
  type        = string
}

variable "state_container_name" {
  description = "Containeren som lagrer Terraform-state."
  type        = string
}

variable "service" {
  description = "Tjenestenavn, for eksempel ordre eller meny."
  type        = string
}

variable "runtime" {
  description = "Kjoreplattform for tjenesten: vm eller webapp."
  type        = string

  validation {
    condition     = contains(["vm", "webapp"], var.runtime)
    error_message = "runtime må være vm eller webapp."
  }
}

variable "subnet_prefix" {
  description = "Adresseomradet til tjenestens subnett."
  type        = string
}

variable "allow_http_from" {
  description = "Kildeadresse som tillates pa HTTP-porten."
  type        = string
  default     = "Internet"
}

variable "vm_size" {
  description = "Azure VM-storrelse for VM-tjenester."
  type        = string
  default     = "Standard_B2als_v2"
}

variable "ssh_public_key" {
  description = "Offentlig SSH-nokkel for VM-tjenester."
  type        = string
  default     = ""
}

variable "webapp_sku" {
  description = "App Service Plan SKU for webapp-tjenester."
  type        = string
  default     = "B1"
}