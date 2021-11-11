resource "aws_eip" "Son_eip_ng" {
  vpc = true
}


resource "aws_nat_gateway" "Son_ng" {
  allocation_id = aws_eip.Son_eip_ng.id
  subnet_id = aws_subnet.Son_puba.id

  tags = {
    "Name" = "Son_ng"
  }

  depends_on = [
    aws_internet_gateway.Son_ig
  ]
}

