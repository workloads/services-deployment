# enable Serial Console for AWS EC2 Instances
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_serial_console_access
resource "aws_ec2_serial_console_access" "main" {
  enabled = true
}
