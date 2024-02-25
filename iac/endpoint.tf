resource "azurerm_linux_virtual_machine" "terraform_endpoint" {
  name                = "terraform-endpoint"
  resource_group_name = azurerm_resource_group.terraform_gp.name
  location            = azurerm_resource_group.terraform_gp.location
  size                = "Standard_B1s"
  admin_username      = "u_hub"
  network_interface_ids = [azurerm_network_interface.terraform_nic.id]

  admin_ssh_key {
    username   = "u_hub"
    public_key = azurerm_ssh_public_key.tf_key.public_key
  }

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
