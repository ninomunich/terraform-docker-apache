resource "azurerm_ssh_public_key" "tf_key" {
  name                = "tf_key"
  resource_group_name = azurerm_resource_group.terraform_gp.name
  location            = azurerm_resource_group.terraform_gp.location
  public_key            = file("~/.ssh/id_rsa.pub")
}

resource "azurerm_network_security_group" "terraform-nsg" {
  name                = "terraform_nsg"
  resource_group_name = azurerm_resource_group.terraform_gp.name
  location            = azurerm_resource_group.terraform_gp.location

  security_rule {
    name                       = "SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTPS"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
