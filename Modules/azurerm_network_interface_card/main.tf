resource "azurerm_network_interface" "nic1" {
  for_each = var.network_interface_card
  name     = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name = each.value.ip_config_name
    public_ip_address_id = data.azurerm_public_ip.pip1[each.key].id
    subnet_id = data.azurerm_subnet.subnet1[each.key].id

    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "vm1" {
  for_each = var.network_interface_card
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = [ azurerm_network_interface.nic1[each.key].id ]
  
  custom_data = filebase64("${path.module}/cloud-init.yaml")

  disable_password_authentication = false
  admin_password                  = each.value.admin_password


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}




