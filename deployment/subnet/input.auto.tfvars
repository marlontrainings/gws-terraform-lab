aws_region = "ap-southeast-1"

instances = {
  "subnet-vcs-001" = {
    vpc_name   = "vpc-private-gws-001"
    cidr_block = "10.4.1.0/24"
    az         = "ap-southeast-1a"
    environment = "dev"
  }
}
