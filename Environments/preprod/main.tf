module "resource_group" {
  source   = "../../Modules/azurerm_resource_group"
  resource = var.resource
}

module "virtual_network" {
  source          = "../../Modules/azurerm_virtual_network"
  virtual_network = var.virtual_network
  depends_on      = [module.resource_group]
}

module "subnet" {
  source     = "../../Modules/azurerm_subnet"
  subnet     = var.subnet
  depends_on = [module.virtual_network]
}

module "public_ip" {
  source     = "../../Modules/azurerm_public_ip"
  public_ip  = var.public_ip
  depends_on = [module.resource_group]
}

module "network_interface" {
  source                 = "../../Modules/azurerm_network_interface_card"
  network_interface_card = var.network_interface_card
  depends_on             = [module.resource_group]
}
