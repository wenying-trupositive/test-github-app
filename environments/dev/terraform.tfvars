# Dev environment — minimal cost, single-AZ

environment = "dev"
region      = "us-east-1"

# Networking
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
enable_nat_gateway   = true

# Compute — EC2 ASG
instance_type    = "t3.small"
min_size         = 1
max_size         = 2
desired_capacity = 1

# Database — RDS PostgreSQL
db_instance_class     = "db.t3.small"
allocated_storage     = 20
max_allocated_storage = 100
multi_az              = false
backup_retention_days = 3

# Storage — S3
app_data_bucket_name = "myapp-dev-data"
logs_bucket_name     = "myapp-dev-logs"
backups_bucket_name  = "myapp-dev-backups"
log_retention_days   = 14
backup_retention_days_s3 = 30

# Azure
azure_location       = "East US"
resource_group_name  = "myapp-dev-rg"
vm_sku               = "Standard_D2s_v5"
instance_count       = 2
