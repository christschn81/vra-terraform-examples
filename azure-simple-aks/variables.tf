variable "prefix" {
  default     = "vra"
  description = "A prefix used for all resources in this example"
}

variable "location" {
  default     = "westeurope"
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster"
  type        = string
  default     = null
}

variable "system_pool_node_count" {
  description = "Initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000 and between min_count and max_count"
  type        = number
}

variable "system_pool_max_pods" {
  description = "Maximum number of pods that can run on each agent"
  type        = number
  default     = 110
}

variable "system_pool_vm_size" {
  description = "Size of the Virtual Machine (e.g: Standard_DS2_v2)"
  type        = string
}

variable "user_pool_vm_size" {
  description = "Size of the Virtual Machine (e.g: Standard_DS2_v2)"
  type        = string
}

variable "user_pool_max_count" {
  description = "Maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000"
  type        = number
}

variable "user_pool_min_count" {
  description = "Minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000"
  type        = number
}

variable "user_pool_availability_zones" {
  description = "List of Availability Zones across which the Node Pool should be spread"
  type        = list(string)
  default     = ["1", "2", "3"]
}

variable "system_pool_availability_zones" {
  description = "List of Availability Zones across which the Node Pool should be spread"
  type        = list(string)
  default     = ["1", "2", "3"]
}
