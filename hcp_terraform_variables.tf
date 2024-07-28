# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "hcp_boundary_cluster_id" {
  key             = "hcp_boundary_cluster_id"
  value           = hcp_boundary_cluster.main.cluster_id
  category        = "terraform"
  description     = "The ID of the HCP Boundary Cluster."
  variable_set_id = data.tfe_variable_set.boundary.id
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "hcp_vault_cluster_id" {
  key             = "hcp_vault_cluster_id"
  value           = module.hcp_vault_aws.hcp_vault_cluster.cluster_id
  category        = "terraform"
  description     = "The ID of the HCP Vault Cluster."
  variable_set_id = data.tfe_variable_set.vault.id
}

# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "hcp_vault_token" {
  key             = "hcp_vault_token"
  value           = hcp_vault_cluster_admin_token.main.token
  category        = "terraform"
  description     = "The Token of the HCP Vault Cluster."
  sensitive       = true
  variable_set_id = data.tfe_variable_set.vault.id
}
