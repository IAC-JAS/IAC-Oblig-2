# Midlertidig stack under migreringen.
# Alle nettverksressurser flyttes til nye stacker.

locals {
  resource_group_name = "rg-${var.kortnavn}-oblig2-${var.miljo}"
  vnet_name           = "vnet-${var.kortnavn}-${var.miljo}"
}