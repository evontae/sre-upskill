terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "main" {
  name = "rg-sre-vm"
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name = "vnet-sre-vm"
  location = var.location
  resource_group_name = azurerm_resource_group.main.name
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "main" {
  name = "snet-sre-vm"
  resource_group_name = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "main" {
  name = "pip-sre-vm"
  location = var.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method = "Static"
}

resource "azurerm_network_interface" "main" {
  name = "nic-sre-vm"
  location = var.location
  resource_group_name = azurerm_resource_group.main.name

    ip_configuration {
        name = "internal"
        subnet_id = azurerm_subnet.main.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.main.id
    }

}

resource "azurerm_linux_virtual_machine" "main" {
  name = "vm-sre-learning"
  location = var.location
  resource_group_name = azurerm_resource_group.main.name
  size = "Standard_B1s"
  admin_username = var.admin_username
  network_interface_ids = [azurerm_network_interface.main.id]

  admin_ssh_key {
    username = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
    }
  os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
  source_image_reference {
  publisher = "Canonical"
  offer     = "ubuntu-24_04-lts"
  sku       = "server"
  version   = "latest"
}

}

resource "azurerm_network_security_group" "main" {
  name = "nsg-sre-vm"
  location = var.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule  {
    name = "allow-ssh"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = var.my_ip
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}
