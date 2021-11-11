
## add router table subnet 
resource "aws_route_table_association" "Son_nta"{
  subnet_id = aws_subnet.Son_pria.id
  route_table_id = aws_route_table.Son_rf.id
}

resource "aws_route_table_association" "Son_ntc" {
  subnet_id = aws_subnet.Son_pric.id
  route_table_id = aws_route_table.Son_rf.id
}

