## route_table 추가 
resource "aws_route_table_association" "Son_rtass_a" {
  subnet_id      = aws_subnet.Son_puba.id
  route_table_id = aws_route_table.Son_rf.id
}

resource "aws_route_table_association" "Son_rtass_c" {
  subnet_id      = aws_subnet.Son_pubc.id
  route_table_id = aws_route_table.Son_rf.id
}

