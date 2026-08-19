resource = {
  rg1 = {
    name     = "testrg1"
    location = "eastus"
  }
  rg2 = {
    name     = "testrg2"
    location = "eastus"
  }
}
virtual_network = {
  vnet1 = {
    name                = "vnet"
    location            = "eastus"
    resource_group_name = "rg1"
    address_space       = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name                 = "subnet1"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

public_ip = {
  pip1 = {
    name                = "pip1"
    location            = "eastus"
    resource_group_name = "rg1"
    allocation_method   = "Static"
  }
}

network_interface_card = {
  nic1 = {
    name                = "nic1"
    location            = "eastus"
    resource_group_name = "rg1"

    ip_config_name = "ipconfig1"

    subnet_name          = "subnet1"
    virtual_network_name = "vnet"
    pip_name             = "pip1"

    vm_name        = "vm1"
    size           = "Standard_D4_v5"
    admin_username = "adminuser"
  }
}