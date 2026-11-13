module "subnet" {
  source = "../../modules/subnet"

  aws_region = var.aws_region
  instances  = var.instances
}