aws_region = "ap-southeast-1"

instances = {
  "vpc-private-vcs-001" = {
    cidr_block           = "10.2.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
    environment          = "dev"
  }
  "vpc-private-vcs-002" = {
    cidr_block           = "10.3.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
    environment          = "qa"
  }
}