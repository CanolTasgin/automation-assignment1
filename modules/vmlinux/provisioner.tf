resource "null_resource" "linux_provisioner" {
  count      = 2
  depends_on = [azurerm_linux_virtual_machine.vm]

  provisioner "remote-exec" {
    inline = [
      "echo Hostname: ${azurerm_linux_virtual_machine.vm[count.index].name}"
    ]

    connection {
      type        = "ssh"
      user        = "admin0487"
      private_key = file("/Users/canoltasgin/.ssh/id_rsa")
      host        = azurerm_public_ip.pip[count.index].ip_address
    }
  }
}
