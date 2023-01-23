# see https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "hcp_vault_cluster_id" {
  key             = "hcp_vault_cluster_id"
  value           = module.hcp_vault_aws.hcp_vault_cluster.cluster_id
  category        = "terraform"
  description     = "The ID of the HCP Vault Cluster."
  variable_set_id = data.tfe_variable_set.vault.id
}
