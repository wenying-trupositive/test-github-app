# DevOps Infrastructure — Test Repo

This repository simulates a real-world DevOps infrastructure codebase using **Terraform** targeting **AWS** and **Azure**. It is used to test the [Trupositive AI GitHub App](https://github.com/wenying-trupositive/test-github-app), which automatically estimates cloud cost changes on pull requests.

## Repository Structure

```
terraform/
├── aws/
│   ├── networking/     # VPC, subnets, NAT Gateway
│   ├── compute/        # EC2 Auto Scaling Group, ALB
│   ├── database/       # RDS PostgreSQL
│   └── storage/        # S3 buckets
└── azure/
    ├── networking/     # VNet, subnets, NSG
    └── compute/        # VM Scale Set, Load Balancer

environments/
├── dev/                # Dev-size resources
├── staging/            # Staging-size resources
└── prod/               # Production-size resources
```

## How to Test the GitHub App

1. Create a new branch from `main`
2. Make a change to any Terraform resource (see examples below)
3. Open a Pull Request
4. The Trupositive AI app will comment with the estimated cost impact

### Example PR Scenarios

| Scenario | File to change | What to change |
|---|---|---|
| Upgrade RDS | `terraform/aws/database/main.tf` | `instance_class = "db.t3.large"` |
| Scale up EC2 ASG | `terraform/aws/compute/main.tf` | `min_size = 4`, `max_size = 10` |
| Add ElastiCache | `terraform/aws/compute/main.tf` | Add `aws_elasticache_cluster` resource |
| Larger Azure VMs | `terraform/azure/compute/main.tf` | `sku { name = "Standard_D4s_v3" }` |

## Environments

| Environment | AWS Instance | Azure VM | Notes |
|---|---|---|---|
| dev | t3.small | Standard_B2s | Minimal cost, single-AZ |
| staging | t3.medium | Standard_D2s_v3 | Mid-tier, single-AZ |
| prod | t3.large | Standard_D4s_v3 | Multi-AZ, replicas |
