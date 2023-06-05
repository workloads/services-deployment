terraform {
  # see https://developer.hashicorp.com/terraform/language/settings/terraform-cloud
  cloud {
    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#organization
    organization = "workloads"

    # see https://developer.hashicorp.com/terraform/cli/cloud/settings#workspaces
    workspaces {
      name = "services-deployment"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/aws/5.1.0
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.1.0, < 6.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.59.0
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.59.0, < 1.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.45.0
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.45.0, < 1.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.4.0, < 1.5.0"
}
