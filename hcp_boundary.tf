# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster#password
resource "hcp_boundary_cluster" "main" {
  cluster_id = var.project_identifier
  tier       = var.hcp_boundary_cluster_tier
  username   = var.hcp_boundary_admin_username
  password   = var.hcp_boundary_admin_password
}
