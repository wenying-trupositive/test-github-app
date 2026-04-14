variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}

variable "app_data_bucket_name" {
  description = "Name for the application data S3 bucket"
  type        = string
}

variable "logs_bucket_name" {
  description = "Name for the logs S3 bucket"
  type        = string
}

variable "backups_bucket_name" {
  description = "Name for the backups S3 bucket"
  type        = string
}

variable "log_retention_days" {
  description = "Days to retain logs before moving to cheaper storage"
  type        = number
  default     = 30
}

variable "backup_retention_days" {
  description = "Days to retain backups in standard storage"
  type        = number
  default     = 90
}
