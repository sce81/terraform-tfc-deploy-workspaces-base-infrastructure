data "tfe_organization" "main" {
  name = var.organization
}

data "tfe_github_app_installation" "github" {
  installation_id = var.github_installation_id
}
locals {

  base_infra_repo = [
    {
      identifier                 = "sce81/terraform-aws-base-network-root-module"
      github_app_installation_id = data.tfe_github_app_installation.github.id
      branch                     = "main"
    }
  ]

  workspace_vars = {
    base_infra_vars = {
      "dev" = {
        "vpc_name" = {
          value       = "demo"
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
        "cross_account_role" = {
          value       = "development_base_infra_role"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
        "enable_natgw" = {
          value       = false
          description = "deploy transit gateway to this environment"
          category    = "terraform"
        },
        "enable_igw" = {
          value       = false
          description = "deploy internet gateway to this environment"
          category    = "terraform"
        }
      },
      "staging" = {
        "vpc_name" = {
          value       = "demo"
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
        "enable_natgw" = {
          value       = false
          description = "deploy transit gateway to this environment"
          category    = "terraform"
        },
        "enable_igw" = {
          value       = false
          description = "deploy internet gateway to this environment"
          category    = "terraform"
        }
      },

      "production" = {
        "vpc_name" = {
          value       = "demo"
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
        "enable_natgw" = {
          value       = false
          description = "deploy transit gateway to this environment"
          category    = "terraform"
        },
        "enable_igw" = {
          value       = false
          description = "deploy internet gateway to this environment"
          category    = "terraform"
        }
      },
      "public" = {
        "vpc_name" = {
          value       = "demo"
          description = "vpc name identifier"
          category    = "terraform"
        },
        "env_name" = {
          value       = "public"
          description = "env name for identifier"
          category    = "terraform"
        },
        "project_name" = {
          value       = "TFC Automation"
          description = "Project name for tagging purposes"
          category    = "terraform"
        },
        "vpc_cidr" = {
          value       = "10.10.0.0/20"
          description = "vpc network cidr"
          category    = "terraform"
        },
        "public_subnet_cidr" = {
          value       = join(", ", ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "private_subnet_cidr" = {
          value       = join(", ", ["10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "database_subnet_cidr" = {
          value       = join(", ", ["10.10.7.0/24", "10.10.8.0/24", "10.10.9.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "cross_account_role" = {
          value       = "public_base_infra_role"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
        "enable_natgw" = {
          value       = true
          description = "deploy NAT gateway to this environment"
          category    = "terraform"
        },
        "enable_igw" = {
          value       = true
          description = "deploy internet gateway to this environment"
          category    = "terraform"
        }
      },
      "import" = {
        "vpc_name" = {
          value       = "demo"
          description = "vpc name identifier"
          category    = "terraform"
        },
        "env_name" = {
          value       = "import"
          description = "env name for identifier"
          category    = "terraform"
        },
        "project_name" = {
          value       = "TFC Automation"
          description = "Project name for tagging purposes"
          category    = "terraform"
        },
        "vpc_cidr" = {
          value       = "10.11.0.0/20"
          description = "vpc network cidr"
          category    = "terraform"
        },
        "public_subnet_cidr" = {
          value       = join(", ", ["10.11.0.0/24", "10.11.1.0/24", "10.11.2.0/24"])
          description = "public subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "private_subnet_cidr" = {
          value       = join(", ", ["10.11.3.0/24", "10.11.4.0/24", "10.11.5.0/24"])
          description = "private subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "database_subnet_cidr" = {
          value       = join(", ", ["10.11.6.0/24", "10.11.7.0/24", "10.11.8.0/24"])
          description = "database subnets cidr"
          category    = "terraform"
          hcl         = true
        },
        "cross_account_role" = {
          value       = "public_base_infra_role"
          description = "IAM Role for Terraform runner to assume"
          category    = "terraform"
        },
        "enable_natgw" = {
          value       = false
          description = "deploy NAT gateway to this environment"
          category    = "terraform"
        },
        "enable_igw" = {
          value       = false
          description = "deploy internet gateway to this environment"
          category    = "terraform"
        },
        "vpc_id" = {
          value       = "vpc-052ca643852248dea"
          description = "ID for VPC to be imported"
          category    = "terraform"
        },
        "public_subnet_name" = {
          value       = "demo-import-public-*"
          description = "Name of subnets to be imported"
          category    = "terraform"
        },
      },

    }
  }
}