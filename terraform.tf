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
    # see https://registry.terraform.io/providers/hashicorp/aws/4.67.0
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.67.0, < 5.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.56.0
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.56.0, < 1.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.44.1
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.44.1, < 1.0.0"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.4.0, < 1.5.0"
}
