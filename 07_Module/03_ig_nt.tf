# 10.0.0.0/16 Vpc 전용 internet Gateway
resource "aws_internet_gateway" "Son_ig" {
  vpc_id = aws_vpc.Son-vpc.id
  tags = {
    "Name" = "${var.name}-ig"
  }
}


## 라우터 테이블 추가
## 태그는 라우터 안에 안넣음
resource "aws_route_table" "Son_rf" {
  vpc_id = aws_vpc.Son-vpc.id


  route {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.Son_ig.id
  }
  tags = {
    "Name" = "${var.name}-route"
  }
}


## route_table 추가 
resource "aws_route_table_association" "Son_rtass_a" {
  count = length(var.cidr_public)
  subnet_id      = aws_subnet.Son_pub[count.index].id
  route_table_id = aws_route_table.Son_rf.id
}


/*
resource "aws_route_table_association" "Son_rtass_c" {
  subnet_id      = aws_subnet.Son_pubc.id
  route_table_id = aws_route_table.Son_rf.id
}
*/
## add nat gateway
resource "aws_eip" "Son_eip_ng" {
  vpc = true
}


resource "aws_nat_gateway" "Son_ng" {
  allocation_id = aws_eip.Son_eip_ng.id
  subnet_id     = aws_subnet.Son_pub[0].id

  tags = {
    "Name" = "${var.name}ng"
  }

  depends_on = [
    aws_internet_gateway.Son_ig
  ]
}


## NAT route_table
resource "aws_route_table" "Son_router_nt" {
  vpc_id = aws_vpc.Son-vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.Son_ng.id
  }
  tags = {
    "Name" = "${var.name}_Ntrt"
  }
}



## add router table subnet 
resource "aws_route_table_association" "Son_nta" {
  count = length(var.cidr_pri)
  subnet_id      = aws_subnet.Son_pri[count.index].id
  route_table_id = aws_route_table.Son_router_nt.id
}

/*
resource "aws_route_table_association" "Son_ntc" {
  subnet_id      = aws_subnet.Son_pric.id
  route_table_id = aws_route_table.Son_router_nt.id
}

*/