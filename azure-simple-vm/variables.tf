variable "admin_username" {
  default       = "ubuntu"
  description   = "Administrator Account for this VM"
}

variable "resource_group_name_prefix" {
  default       = "vra"
  description   = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_location" {
  default       = "westeurope"
  description   = "Location of the resource group."
}

variable "admin_ssh_key" {
  description   = "Administrator SSH Public Key for this VM"
}

variable "vm_size" {
  default       = "Standard_DS1_v2"
  description   = "VM SKU to choose."
}
