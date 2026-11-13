aws_region = "ap-southeast-1"

instances = {
  "subnet-vcs-001" = {
    vpc_name   = "vpc-private-vcs-001"
    cidr_block = "10.2.1.0/24"
    az         = "ap-southeast-1a"
    environment = "dev"
  }
  "subnet-vcs-002" = {
    vpc_name   = "vpc-private-vcs-001"
    cidr_block = "10.2.0.0/24"
    az         = "ap-southeast-1a"
    environment = "qa"
  }
}
