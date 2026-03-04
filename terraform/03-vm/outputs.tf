output "public_ip" {
  description = "Public IP address of the vm"
  value = azurerm_public_ip.main.ip_address
}

output "ssh_command" {
  description = "SSH command to connect to the vm"
  value = "ssh ${var.admin_username}@${azurerm_public_ip.main.ip_address}"
}