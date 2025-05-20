terraform {
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"

    workspaces {
      name = "deploy-workspaces-base-infrastructure"
    }
  }
  required_providers {
    tfe = {
      version = "~> 0.58.1"
      source  = "hashicorp/tfe"
    }
  }
}