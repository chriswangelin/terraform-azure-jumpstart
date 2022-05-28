output vm_id {
  description = "Virtual machine resource ID."
  value       = azurerm_linux_virtual_machine.vm.id
}

output private_ip_address {
  description = "Virtual machine private IP address."
  value       = azurerm_network_interface.nic_001.private_ip_address
}

output public_ip_address {
  description = "Virtual machine public IP address."
  value       = azurerm_public_ip.pip_001.ip_address
}
