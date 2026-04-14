terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Private DNS Zone for PostgreSQL Flexible Server
resource "azurerm_private_dns_zone" "postgres" {
  name                = "${var.environment}.postgres.database.azure.com"
  resource_group_name = var.resource_group_name

  tags = {
    Name        = "${var.environment}-postgres-dns"
    Environment = var.environment
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres" {
  name                  = "${var.environment}-postgres-dns-link"
  private_dns_zone_name = azurerm_private_dns_zone.postgres.name
  resource_group_name   = var.resource_group_name
  virtual_network_id    = data.azurerm_subnet.db.virtual_network_id
}

data "azurerm_subnet" "db" {
  name                 = split("/", var.db_subnet_id)[10]
  virtual_network_name = split("/", var.db_subnet_id)[8]
  resource_group_name  = var.resource_group_name
}

# PostgreSQL Flexible Server
resource "azurerm_postgresql_flexible_server" "main" {
  name                   = "${var.environment}-postgres-flex"
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = var.postgres_version
  delegated_subnet_id    = var.db_subnet_id
  private_dns_zone_id    = azurerm_private_dns_zone.postgres.id
  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  sku_name   = var.sku_name
  storage_mb = var.storage_mb

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup

  dynamic "high_availability" {
    for_each = var.high_availability_mode != "Disabled" ? [1] : []
    content {
      mode = var.high_availability_mode
    }
  }

  maintenance_window {
    day_of_week  = 0
    start_hour   = 3
    start_minute = 0
  }

  tags = {
    Name        = "${var.environment}-postgres-flex"
    Environment = var.environment
  }

  depends_on = [azurerm_private_dns_zone_virtual_network_link.postgres]
}

# PostgreSQL Configuration
resource "azurerm_postgresql_flexible_server_configuration" "log_connections" {
  name      = "log_connections"
  server_id = azurerm_postgresql_flexible_server.main.id
  value     = "on"
}

resource "azurerm_postgresql_flexible_server_configuration" "log_min_duration" {
  name      = "log_min_duration_statement"
  server_id = azurerm_postgresql_flexible_server.main.id
  value     = "1000"
}
