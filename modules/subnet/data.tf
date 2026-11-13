data "aws_vpc" "this" {
  for_each = var.instances

  filter {
    name   = "tag:Name"
    values = [each.value.vpc_name]
  }
}