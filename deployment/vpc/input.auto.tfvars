aws_region = "ap-southeast-1"

instances = {
  "vpc-private-gws-001" = {
    cidr_block           = "10.4.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
    environment          = "dev"

    tags = {
      TriggerTest = "hcp-vcs-2"
      Purpose     = "lab"
    }
  }
}