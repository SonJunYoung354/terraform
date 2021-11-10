
# 가용영역 a public subnet
resource "aws_subnet" "Son_puba" {
    vpc_id = aws_vpc.Son-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "Son-puba"
  }
}

# 가용영역 a private subnet
resource "aws_subnet" "Son_pria" {
    vpc_id = aws_vpc.Son-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "Son-pria"
  }
}

# 가용영역 c public subnet
resource "aws_subnet" "Son_pubc" {
    vpc_id = aws_vpc.Son-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "Son-pubc"
  }
}

# 가용영역 c private subnet
resource "aws_subnet" "Son_pric" {
    vpc_id = aws_vpc.Son-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "Son-pric"
  }
}