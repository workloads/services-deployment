# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/workspace
data "tfe_workspace" "services_configuration" {
  # TODO: code smell, possibly find a better way of defining this value
  name         = "services-configuration"
  organization = var.tfe_organization
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/variable_set
data "tfe_variable_set" "vault" {
  # TODO: code smell, possibly find a better way of defining this value
  name         = "Vault"
  organization = var.tfe_organization
}
