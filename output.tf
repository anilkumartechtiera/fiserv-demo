output "vpc_id" {
  value = aws_vpc.vpc1.id
}

output "igw_id" {
  
  value = aws_internet_gateway.igw1.id
}

output "public_subnet" {
  value = aws_subnet.pub_sub.id
}