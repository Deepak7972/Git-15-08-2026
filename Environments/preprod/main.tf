module "resource_group" {
  source   = "../../Modules/azurerm_resource_group"
  resource = var.resource
}

module "virtual_network" {
  source          = "../../Modules/azurerm_virtual_network"
  virtual_network = var.virtual_network
}

module "subnet" {
  source = "../../Modules/azurerm_subnet"
  subnet = var.subnet
}

module "public_ip" {
  source    = "../../Modules/azurerm_public_ip"
  public_ip = var.public_ip
}

module "network_interface" {
  source                 = "../../Modules/azurerm_network_interface_card"
  network_interface_card = var.network_interface_card
}

module "virtual_machine" {
  source                 = "../../Modules/azurerm_network_interface_card"
  network_interface_card = var.network_interface_card
}