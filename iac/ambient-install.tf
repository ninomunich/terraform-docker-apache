resource "azurerm_virtual_machine_extension" "ambient-exec" {
  name                 = "ambient-exec"
  virtual_machine_id   = azurerm_linux_virtual_machine.terraform_endpoint.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    script = base64encode(file("${path.module}/ambient-script.sh"))
  })
}
