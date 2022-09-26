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
    # see # see https://registry.terraform.io/providers/hashicorp/aws/4.32.0/
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.32.0, < 5.0.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcp/0.45.0/
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.45.0, < 1.0.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = ">= 1.3.0"
}
