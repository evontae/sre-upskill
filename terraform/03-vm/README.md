# Azure Linux VM Module

This module deploys a secure Linux virtual machine on Azure with all 
required networking infrastructure.

## Resources Deployed

| Resource | Purpose |
|----------|---------|
| Resource Group | Logical container for all resources |
| Virtual Network | Isolated network space for the VM |
| Subnet | Network segment the VM is attached to |
| Network Interface (NIC) | Connects the VM to the subnet |
| Public IP | Enables external SSH access |
| Network Security Group | Firewall rule restricting SSH to your IP only |
| Linux VM | Ubuntu 24.04 LTS - Standard_B1s |

## Security

SSH password authentication is disabled. Access is via SSH key only.
Inbound SSH (port 22) is restricted to your specified public IP address
to minimize attack surface.

## Prerequisites

- Terraform installed
- Azure CLI installed and authenticated (`az login`)
- SSH key pair at `~/.ssh/id_rsa.pub`
- Your public IP address (`curl ifconfig.me`)

## Usage
```bash
terraform init
terraform plan
terraform apply
```

You will be prompted to enter your public IP address at runtime.

## Outputs

After a successful apply Terraform will print:

- `public_ip` - The public IP address of the VM
- `ssh_command` - The exact command to SSH into the VM

## Cleanup

Always destroy resources when not in use to avoid unnecessary costs.
```bash
terraform destroy
```
