terraform {
  # see https://www.terraform.io/language/settings/terraform-cloud
  cloud {
    # see https://www.terraform.io/cli/cloud/settings#organization
    organization = "workloads"

    # see https://www.terraform.io/cli/cloud/settings#workspaces
    workspaces {
      name = "services-deployment"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/hcp/0.44.0/
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.44.0, < 1.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/tfe/0.36.1/
    tfe = {
      source  = "hashicorp/tfe"
      version = ">= 0.36.1, < 1.0.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = ">= 1.2.9"
}
