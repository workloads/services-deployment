# see https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/boundary_cluster
resource "hcp_boundary_cluster" "main" {
  cluster_id = var.project_identifier
  tier       = var.hcp_boundary_cluster_tier
  username   = var.hcp_boundary_admin_username
  password   = var.hcp_boundary_admin_password

  maintenance_window_config {
    day          = var.hcp_boundary_maintenance_window.day
    start        = var.hcp_boundary_maintenance_window.start
    end          = var.hcp_boundary_maintenance_window.end
    upgrade_type = var.hcp_boundary_maintenance_window.upgrade_type
  }
}
