variable "kortnavn" {
  description = "Kortnavn brukt i Azure-ressursnavn."
  type        = string
}

variable "location" {
  description = "Azure-regionen ressursene opprettes i."
  type        = string
}

variable "miljo" {
  description = "Miljøet, for eksempel dev eller prod."
  type        = string
}

variable "address_space" {
  description = "Adressene som VNet-et skal bruke."
  type        = list(string)
}