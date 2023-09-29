terraform {
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"

    workspaces {
      name = "deploy-workspaces-base-infrastructure"
    }
  }
  required_providers {
    tfe = {
      version = "~> 0.48.0"
      source  = "hashicorp/tfe"
    }
  }
}