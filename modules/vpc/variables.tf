variable "aws_region" {
  type = string
}

variable "instances" {
  type = map(object({
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
    environment          = string
  }))
}