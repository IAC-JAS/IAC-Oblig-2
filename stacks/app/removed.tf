# Flytt VM, nettverkskort og offentlig IP uten å slette dem.
removed {
  from = module.vm

  lifecycle {
    destroy = false
  }
}

# Flytt App Service Plan og webapp uten å slette dem.
removed {
  from = module.webapp

  lifecycle {
    destroy = false
  }
}