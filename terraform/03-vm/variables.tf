variable "location" {
  description = "Azure region for all resrouces"
  type = string
  default = "East US"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "my_ip" {
    description = "My public IP address for SSH"
    type = string
    
  
}