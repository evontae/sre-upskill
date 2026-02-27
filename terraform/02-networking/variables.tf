variable "location" {
  description = "Azure region for all resrouces"
  type = string
  default = "East US"
}

variable "resource_prefix" {
    description = "Prefix used for naming all resources"
    type = string
    default = "sre"
}