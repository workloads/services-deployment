module "hcp_vault_aws" {
  # see
  source  = "ksatirli/vault-cluster/hcp"
  version = "1.1.0"

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
