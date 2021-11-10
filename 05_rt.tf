## 라우터 테이블 추가
## 태그는 라우터 안에 안넣음
resource "aws_route_table" "Son_rf" {
    vpc_id = aws_vpc.Son-vpc.id
  

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.Son_ig.id
  }
  tags = {
    "Name" = "Son-route"
  }
}