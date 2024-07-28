output "hcp_vault_urls" {
  description = "HCP Vault URLs."
  sensitive   = true

  value = [
    module.hcp_vault_aws.hcp_vault_cluster,
    module.hcp_vault_aws.cluster_overview_url,
    module.hcp_vault_aws.cluster_metrics_url,
    module.hcp_vault_aws.cluster_audit_logs_url,
    module.hcp_vault_aws.cluster_snapshots_url,
    module.hcp_vault_aws.cluster_replication_url,
  ]
}

output "hcp_boundary_urls" {
  description = "HCP Boundary URLs."

  value = [
    hcp_boundary_cluster.main.cluster_url
  ]
}

output "tfe_workspace_terraform_version" {
  description = "Terraform version identifier of current HCP Terraform Workspace."
  value       = data.tfe_workspace.main.terraform_version
}
