resource "aws_route_table" "pub_rt" {
    vpc_id     = aws_vpc.vpc1.id
}

resource "aws_route_table" "priv_rt" {
    vpc_id     = aws_vpc.vpc1.id
}

resource "aws_route_table_association" "pub_rt" {
  subnet_id      = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "priv_rt" {
  subnet_id      = aws_subnet.priv_sub.id
  route_table_id = aws_route_table.priv_rt.id
}

resource "aws_route" "pub_rt" {
  route_table_id  = aws_route_table.pub_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id  = aws_internet_gateway.igw1.id
}