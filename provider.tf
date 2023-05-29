terraform {
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"

    workspaces {
      name = "deploy-tfc-workspaces-base-infra"
    }
  }
  required_providers {
    tfe = {
      version = "0.45.0"
      source  = "hashicorp/tfe"
    }
  }
}