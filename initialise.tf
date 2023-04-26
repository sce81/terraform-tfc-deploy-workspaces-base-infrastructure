terraform {
  cloud {
    organization = "HashiCorp_TFC_Automation_Demo"

    workspaces {
      name = "terraform-env-tfc-workspaces-base-infrastructure"
    }
  }
  required_providers {
    tfe = {
      version = "0.44.1"
      source  = "hashicorp/tfe"
    }
  }
}