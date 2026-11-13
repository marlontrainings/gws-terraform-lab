terraform {
  required_version = ">= 1.5.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.51.0"
    }
  }

  cloud {
    organization = "laboratory1"

    workspaces {
      name = "subnet"
    }
  }
}