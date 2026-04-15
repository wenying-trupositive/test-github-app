# Prod environment — production-sized, Multi-AZ

environment = "prod"
region      = "us-east-1"

# Networking
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
enable_nat_gateway   = true

# Compute — EC2 ASG
instance_type    = "t3.large"
min_size         = 2
max_size         = 10
desired_capacity = 3

# Database — RDS PostgreSQL (Multi-AZ)
db_instance_class     = "db.t3.medium"
allocated_storage     = 100
max_allocated_storage = 1000
multi_az              = true
backup_retention_days = 14

# Storage — S3
app_data_bucket_name = "myapp-prod-data"
logs_bucket_name     = "myapp-prod-logs"
backups_bucket_name  = "myapp-prod-backups"
log_retention_days   = 90
backup_retention_days_s3 = 365

# Azure
azure_location       = "East US"
resource_group_name  = "myapp-prod-rg"
vm_sku               = "Standard_D8s_v5"
instance_count       = 3
