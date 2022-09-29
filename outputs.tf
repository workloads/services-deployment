output "hcp_boundary_urls" {
  description = "HCP Boundary URLs."

  value = [
    hcp_boundary_cluster.main.cluster_url
  ]
}
