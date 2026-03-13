# SRE Upskill

A hands-on learning repository documenting my progression toward 
a senior Site Reliability / Cloud Engineering role. Everything here 
is built from scratch using real tools in a real Azure environment.
No tutorials. No copy-paste. Just building.

## Projects

### 01 - Terraform Basics
First Terraform deployment on Azure. Covers provider configuration,
resource groups, state management, and the init/plan/apply/destroy 
workflow.

### 02 - Networking
Virtual network and subnet provisioning using Terraform. Introduces
resource dependencies, implicit dependency graphs, variables, and 
outputs.

### 03 - Linux VM
Full VM deployment including VNet, subnet, public IP, NIC, and NSG.
SSH key authentication only — password authentication disabled.
NSG restricts inbound SSH to a specific IP to minimize attack surface.
Includes a bash system health monitoring script.

## What's Coming
- Docker and containerization
- Observability stack with Prometheus and Grafana
- CI/CD pipeline with GitHub Actions
- System design documentation

## Tools & Technologies
Terraform, Azure, Bash, Linux, Git