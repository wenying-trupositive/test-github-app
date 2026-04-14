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

variable "db_subnet_id" {
  description = "Subnet ID delegated to PostgreSQL Flexible Server"
  type        = string
}

variable "sku_name" {
  description = "SKU for the PostgreSQL Flexible Server (e.g. GP_Standard_D2s_v3)"
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "storage_mb" {
  description = "Storage size in MB"
  type        = number
  default     = 65536
}

variable "postgres_version" {
  description = "PostgreSQL major version"
  type        = string
  default     = "15"
}

variable "admin_username" {
  description = "Administrator login for the PostgreSQL server"
  type        = string
  default     = "psqladmin"
  sensitive   = true
}

variable "admin_password" {
  description = "Administrator password for the PostgreSQL server"
  type        = string
  sensitive   = true
}

variable "backup_retention_days" {
  description = "Backup retention period in days (7–35)"
  type        = number
  default     = 7
}

variable "geo_redundant_backup" {
  description = "Enable geo-redundant backups"
  type        = bool
  default     = false
}

variable "high_availability_mode" {
  description = "High availability mode: Disabled, SameZone, or ZoneRedundant"
  type        = string
  default     = "Disabled"
}
