module "hcp_vault_aws" {
  source  = "ksatirli/vault-cluster/hcp"
  version = "1.1.0"
  # see https://registry.terraform.io/modules/ksatirli/vault-cluster/hcp/latest

  cluster_id = "${var.project_identifier}-aws"
  hvn_id     = var.hvn_id_aws

  metrics_config = {
    enabled         = true
    datadog_api_key = var.datadog_api_key
    datadog_region  = "us1"
  }

  min_vault_version = "1.10.3"
  public_endpoint   = true

  # see https://cloud.hashicorp.com/products/vault/pricing
  tier = "starter_small"
}

# retrieve information about the HCP Vault Cluster
# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/data-sources/vault_cluster
data "hcp_vault_cluster" "main" {
  cluster_id = module.hcp_vault_aws.hcp_vault_cluster.cluster_id
}

# create Vault Admin Token to be able to make changes to HCP Vault configuration
# ⚠️ Note that this will persist a Vault Admin Token to Terraform State.
# ⚠️ Disabling this resource does NOT invalidate the provisioned admin token.
# for more guidance, see https://developer.hashicorp.com/terraform/language/state/sensitive-data
# and https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster_admin_token
resource "hcp_vault_cluster_admin_token" "main" {
  cluster_id = data.hcp_vault_cluster.main.cluster_id
}
