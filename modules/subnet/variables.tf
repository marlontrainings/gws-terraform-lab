variable "aws_region" {
  type = string
}

variable "instances" {
  type = map(object({
    vpc_name   = string
    cidr_block = string
    az         = string
    environment = string
  }))
}