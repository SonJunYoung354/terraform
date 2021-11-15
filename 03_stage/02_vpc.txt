resource "aws_vpc" "Son-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "Son-Vpc"
  }
}
