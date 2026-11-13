resource "aws_vpc" "this" {
  for_each = var.instances

  cidr_block           = each.value.cidr_block
  enable_dns_support   = each.value.enable_dns_support
  enable_dns_hostnames = each.value.enable_dns_hostnames

  tags = {
    Name        = each.key
    Environment = each.value.environment
  }
}