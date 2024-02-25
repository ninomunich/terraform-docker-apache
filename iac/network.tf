#VNET
resource "azurerm_virtual_network" "terraform_vnet" {
  name                = "terraform-vnet"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.terraform_gp.location
  resource_group_name = azurerm_resource_group.terraform_gp.name
}
resource "azurerm_subnet" "terraform_subnet" {
  name                 = "terraform_subnet"
  resource_group_name  = azurerm_resource_group.terraform_gp.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = ["10.10.10.0/24"]

}
resource "azurerm_public_ip" "terraform_pip" {
  name                = "terraform-pip"
  location            = azurerm_resource_group.terraform_gp.location
  resource_group_name = azurerm_resource_group.terraform_gp.name
  allocation_method   = "Static"
}
resource "azurerm_network_interface" "terraform_nic" {
  name                      = "terraform-nic"
  location                  = azurerm_resource_group.terraform_gp.location
  resource_group_name       = azurerm_resource_group.terraform_gp.name
  

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terraform_pip.id
  }
}
