data "tfe_organization" "main" {
  name = var.organization
}

data "tfe_github_app_installation" "github" {
  installation_id = var.github_installation_id
}
locals {

  base_infra_repo = [
    {
      identifier                 = "sce81/terraform-aws-infrastructure-network-layer"
      github_app_installation_id = var.github_installation_id
      branch                     = "main"
    }
  ]

  workspace_vars = {
    base_infra_vars = {
      "dev" = {
        "vpc_name" = {
          value       = "automation"
          description = "vpc name identifier"
          category    = "terraform"
        },
        "env_name" = {
          value       = "dev"
          description = "env name for identifier"
          category    = "terraform"
        },
        "project_name" = {
          value       = "TFC Automation"
          description = "Project Name for tagging purposes"
          category    = "terraform"
        },
        "vpc_cidr" = {
          value       = "10.0.0.0/20"
          description = "vpc network cidr"
          category    = "terraform"
        },
        "public_subnet_cidr" = {
          value       = join(", ", ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "private_subnet_cidr" = {
          value       = join(", ", ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "database_subnet_cidr" = {
          value       = join(", ", ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "auto_apply" = {
          value       = "true"
          description = "boolean flag on whether terraform apply runs will be automatically accepted"
          category    = "terraform"
        },
        "structured_run_output_enabled" = {
          value       = "true"
          description = "boolean flag on whether terraform plan outputs use the structured or classic run reporting"
          category    = "terraform"
        },
        "cross_account_role" = {
          value       = "development_base_infra_role"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
      },
      "staging" = {
        "vpc_name" = {
          value       = "automation"
          description = "vpc name identifier"
          category    = "terraform"
        },
        "env_name" = {
          value       = "staging"
          description = "env name for identifier"
          category    = "terraform"
        },
        "project_name" = {
          value       = "TFC Automation"
          description = "Project name for tagging purposes"
          category    = "terraform"
        },
        "vpc_cidr" = {
          value       = "10.1.0.0/20"
          description = "vpc network cidr"
          category    = "terraform"
        },
        "public_subnet_cidr" = {
          value       = join(", ", ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "private_subnet_cidr" = {
          value       = join(", ", ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "database_subnet_cidr" = {
          value       = join(", ", ["10.1.7.0/24", "10.1.8.0/24", "10.1.9.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "cross_account_role" = {
          value       = "staging_base_infra_role"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
      },
      "production" = {
        "vpc_name" = {
          value       = "automation"
          description = "vpc name identifier"
          category    = "terraform"
        },
        "env_name" = {
          value       = "production"
          description = "env name for identifier"
          category    = "terraform"
        },
        "project_name" = {
          value       = "TFC Automation"
          description = "Project name for tagging purposes"
          category    = "terraform"
        },
        "vpc_cidr" = {
          value       = "10.2.0.0/20"
          description = "vpc network cidr"
          category    = "terraform"
        },
        "public_subnet_cidr" = {
          value       = join(", ", ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "private_subnet_cidr" = {
          value       = join(", ", ["10.2.4.0/24", "10.2.5.0/24", "10.2.6.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "database_subnet_cidr" = {
          value       = join(", ", ["10.2.7.0/24", "10.2.8.0/24", "10.2.9.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "cross_account_role" = {
          value       = "production_base_infra_role"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
      },
    }
  }
}