resource "aws_subnet" "this" {
  for_each = var.instances

  vpc_id            = data.aws_vpc.this[each.key].id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  map_public_ip_on_launch = false  # ✅ private subnet

  tags = {
    Name        = each.key
    Environment = each.value.environment
  }
}