# Flytt begge tjenestenes storage accounts uten sletting.
removed {
  from = module.storage

  lifecycle {
    destroy = false
  }
}

# Flytt begge tjenestenes Key Vaults uten sletting.
removed {
  from = module.keyvault

  lifecycle {
    destroy = false
  }
}