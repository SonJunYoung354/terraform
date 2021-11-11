## NAT route_table
resource "aws_route_table" "Son_router_nt" {
    vpc_id = aws_vpc.Son-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.Son_ng.id
    }
    tags = {
      "Name" = "Son_Ntrt"
    }
}