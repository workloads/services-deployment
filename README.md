# HCP Terraform Workspace `services-deployment`

> This repository manages services deployment for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [Terraform Cloud Workspace `services-deployment`](#terraform-cloud-workspace-services-deployment)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
    * [Development](#development)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Notes](#notes)
    * [Sensitive Data](#sensitive-data)
  * [Contributors](#contributors)
  * [License](#license)
<!-- TOC -->

## Requirements

- HashiCorp Terraform `1.9.x` or [newer](https://developer.hashicorp.com/terraform/downloads)

### Development

For development and testing of this repository:

- `terraform-docs` `0.18.0` or [newer](https://terraform-docs.io/user-guide/installation/)

## Usage

This repository uses a standard Terraform workflow (`init`, `plan`, `apply`).

For more information, including detailed usage guidelines, see the [Terraform documentation](https://developer.hashicorp.com/terraform/cli/commands).

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| aws_directory_admin_password | AWS Directory Service Admin Password. | `string` | yes |
| aws_directory_admin_username | AWS Directory Service Admin Username. | `string` | yes |
| datadog_api_key | Datadog API Key. | `string` | yes |
| datadog_api_url | Datadog API URL. | `string` | yes |
| datadog_api_zone | Datadog API Zone. | `string` | yes |
| datadog_app_key | Datadog App Key. | `string` | yes |
| hcp_boundary_admin_password | HCP Boundary Cluster Admin Password. | `string` | yes |
| hcp_boundary_admin_username | HCP Boundary Cluster Admin Username. | `string` | yes |
| hcp_boundary_cluster_id | The ID of the HCP Boundary Cluster. | `string` | yes |
| hvn_id_aws | AWS-specific HashiCorp HVN Identifier. | `string` | yes |
| management_region_aws | AWS-specific `Management` Region Identifier. | `string` | yes |
| project_identifier | Human-readable Project Identifier. | `string` | yes |
| tfe_organization | Name of HCP Terraform Organization. | `string` | yes |
| hcp_boundary_cluster_tier | The tier that the HCP Boundary cluster will be provisioned as. | `string` | no |
| hcp_boundary_maintenance_window | The maintenance window configuration for when cluster upgrades can take place. | <pre>object({<br>    day          = string<br>    start        = number<br>    end          = number<br>    upgrade_type = string<br>  })</pre> | no |

### Outputs

| Name | Description |
|------|-------------|
| hcp_boundary_urls | HCP Boundary URLs. |
| hcp_vault_urls | HCP Vault URLs. |
<!-- END_TF_DOCS -->

## Notes

### Sensitive Data

Terraform state may contain [sensitive data](https://developer.hashicorp.com/terraform/language/state/sensitive-data). This workspace uses [Terraform Cloud](https://developer.hashicorp.com/terraform/cloud-docs) to safely store state, and encrypt the data at rest.

## Contributors

For a list of current (and past) contributors to this repository, see [GitHub](https://github.com/workloads/services-deployment/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may download a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

See the License for the specific language governing permissions and limitations under the License.
