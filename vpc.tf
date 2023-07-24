resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr_range

  tags = {
      project = var.project
  }
}