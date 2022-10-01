module "hcp_vault_aws" {
  source = "git@github.com:ksatirli/terraform-hcp-vault-cluster.git?ref=adds-tf13-support"
  #source  = "ksatirli/vault-cluster/hcp"
  #version = "0.8.0"

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
