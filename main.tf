resource "tfe_project" "base_infra" {
  organization = "HashiCorp_TFC_Automation_Demo"
  name         = "baseinfra"
}


module "AWS_Workspace_Base_Infra" {
  for_each = local.workspace_vars.base_infra_vars

  source                        = "app.terraform.io/HashiCorp_TFC_Automation_Demo/workspace-management/tfc"
  version                       = "2.0.8"
  name                          = "aws_workspace_base_infra_${each.key}"
  organization                  = data.tfe_organization.main.name
  vcs_repo                      = local.base_infra_repo
  tfe_variables                 = each.value
  project_id                    = tfe_project.base_infra.id
  structured_run_output_enabled = "false"
  workspace_tags                = [each.key, "aws", "base_infra", "platform", "aws-ug"]
  sentinel_policy               = flatten(["Require-Resources-from-PMR", "Enforce-Tagging-Policy", var.infra_policies])
  auto_apply                    = true
  depends_on = [
    tfe_project.base_infra
  ]
}
