# terraform-aws-env-deploy-workspaces-base-infrastructure
Terraform environment for deploying baseline infrastructure to multiple AWS Accounts

## Getting Started

This module is intended to create a Project with multiple Terraform Cloud Workspaces with optional associated variables within Terraform Cloud

Resources
- tfe_project
- tfe_workspace
- tfe_variable


### Prerequisites

    Terraform ~> 1.4.0

### Tested

    Terraform ~> 1.4.6
    TFE       ~> 0.45.0
### Installing

This module should be called by a terraform environment configuration

##### Usage

```
    module "example_workspace" {
      source           = "app.terraform.io/YOURORG/tfc-workspace/module"
      version          = "1.0.0"
        name           = "tfc_workspace_example"
        organization   = var.org_name
        tfe_variables  = local.dev_vars
        project_id     = var.project_id
        workspace_tags = ["tag1", "tag2", "tag3"]
    }
```



### Outputs

The following values are outputted
```
    id                  = tfe_workspace.main.id
```

