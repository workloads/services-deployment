# see https://registry.terraform.io/providers/DataDog/datadog/latest/docs#api_key
variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key."
  sensitive   = true
}

# see https://registry.terraform.io/providers/DataDog/datadog/latest/docs#api_url
variable "datadog_api_url" {
  type        = string
  description = "Datadog API URL."
}

# see https://registry.terraform.io/providers/DataDog/datadog/latest/docs#api_url
variable "datadog_api_zone" {
  type        = string
  description = "Datadog API Zone."
}

# see https://registry.terraform.io/providers/DataDog/datadog/latest/docs#app_key
variable "datadog_app_key" {
  type        = string
  description = "Datadog App Key."
  sensitive   = true
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster#password
variable "hcp_boundary_admin_password" {
  type        = string
  description = "HCP Boundary Cluster Admin Password."
  sensitive   = true
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster#username
variable "hcp_boundary_admin_username" {
  type        = string
  description = "HCP Boundary Cluster Admin Username."
}

variable "hvn_id_aws" {
  type        = string
  description = "AWS-specific HashiCorp HVN Identifier."
}

variable "project_identifier" {
  type        = string
  description = "Human-readable Project Identifier."
}

variable "tfe_organization" {
  type        = string
  description = "Name of the Terraform Cloud Organization."
}

locals {
  # HCP Vault-specific Configuration Variables for Cluster lifecycle management
  hcp_vault_variables = [
    {
      key         = "hcp_vault_cluster_id"
      category    = "terraform"
      value       = module.hcp_vault_aws.hcp_vault_cluster.cluster_id
      description = "HCP Vault Cluster ID."
      sensitive   = false
    }
  ]
}
