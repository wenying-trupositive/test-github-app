variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "public_subnet_id" {
  description = "Subnet ID for the Load Balancer frontend"
  type        = string
}

variable "private_subnet_id" {
  description = "Subnet ID for VM Scale Set instances"
  type        = string
}

variable "vm_sku" {
  description = "VM size for the Scale Set instances"
  type        = string
  default     = "Standard_D4s_v3"
}

variable "instance_count" {
  description = "Number of VM instances in the Scale Set"
  type        = number
  default     = 3
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB for VM instances"
  type        = number
  default     = 128
}

variable "enable_accelerated_networking" {
  description = "Enable accelerated networking on VM NICs"
  type        = bool
  default     = true
}

variable "admin_username" {
  description = "Admin username for VM instances"
  type        = string
  default     = "azureadmin"
}

variable "admin_ssh_public_key" {
  description = "SSH public key for VM admin access"
  type        = string
}
