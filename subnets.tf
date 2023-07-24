resource "aws_subnet" "pub_sub" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.pub_sub_cidr

  tags = {
    project = var.project
  }
}

resource "aws_subnet" "priv_sub" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.priv_sub_cidr

  tags = {
    project = var.project
  }
}