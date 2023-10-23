# primary directory for WorkDocs and WorkMail
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/directory_service_directory
resource "aws_directory_service_directory" "main" {
  alias = var.project_identifier

  # name does not need to be publicly accessible
  name = "aws-ad.workloads.io"

  description = "Active Directory for WorkDocs and WorkMail."
  password    = var.aws_directory_admin_password
  short_name  = upper(var.project_identifier)
  size        = "Small"
  type        = "SimpleAD"

  vpc_settings {
    vpc_id = data.aws_vpc.default.id

    # AWS Directory Service expects exactly 2 subnets
    # see https://developer.hashicorp.com/terraform/language/functions/slice
    subnet_ids = slice(data.aws_subnets.default.ids, 0, 2)
  }
}

