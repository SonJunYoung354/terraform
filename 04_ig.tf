# 10.0.0.0/16 Vpc 전용 internet Gateway
resource "aws_internet_gateway" "Son_ig" {
    vpc_id = aws_vpc.Son-vpc.id
    tags = {
      "Name" = "Son-ig"
    }
}
