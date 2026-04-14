# Staging environment — mid-tier, single-AZ

environment = "staging"
region      = "us-east-1"

# Networking
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
enable_nat_gateway   = true

# Compute — EC2 ASG
instance_type    = "t3.medium"
min_size         = 2
max_size         = 5
desired_capacity = 2

# Database — RDS PostgreSQL
db_instance_class     = "db.t3.medium"
allocated_storage     = 100
max_allocated_storage = 500
multi_az              = false
backup_retention_days = 7

# Storage — S3
app_data_bucket_name = "myapp-staging-data"
logs_bucket_name     = "myapp-staging-logs"
backups_bucket_name  = "myapp-staging-backups"
log_retention_days   = 30
backup_retention_days_s3 = 90

# Azure
azure_location       = "East US"
resource_group_name  = "myapp-staging-rg"
vm_sku               = "Standard_D2s_v3"
instance_count       = 2
