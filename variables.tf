variable "aws_directory_admin_username" {
  type        = string
  description = "AWS Directory Service Admin Username."
}

variable "aws_directory_admin_password" {
  type        = string
  description = "AWS Directory Service Admin Password."
  sensitive   = true
}

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

# this value is set in the `Boundary` Variable Set, inside HCP Terraform
# see https://app.terraform.io/app/workloads/settings/varsets
variable "hcp_boundary_cluster_id" {
  type        = string
  description = "The ID of the HCP Boundary Cluster."
}

variable "hcp_boundary_cluster_tier" {
  type        = string
  description = "The tier that the HCP Boundary cluster will be provisioned as."
  default     = "standard"

  validation {
    condition     = can(regex("^(standard|premium)$", var.hcp_boundary_cluster_tier))
    error_message = "The HCP Boundary cluster tier must be either `standard` or `premium`."
  }
}

# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster#maintenance_window_config
variable "hcp_boundary_maintenance_window" {
  type = object({
    day          = string
    start        = number
    end          = number
    upgrade_type = string
  })

  description = "The maintenance window configuration for when cluster upgrades can take place."

  default = {
    day          = "TUESDAY"
    start        = 2 # time in UTC
    end          = 4 # time in UTC
    upgrade_type = "SCHEDULED"
  }
}

variable "hvn_id_aws" {
  type        = string
  description = "AWS-specific HashiCorp HVN Identifier."
}

variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

variable "project_identifier" {
  type        = string
  description = "Human-readable Project Identifier."
}

variable "tfe_organization" {
  type        = string
  description = "Name of HCP Terraform Organization."
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
