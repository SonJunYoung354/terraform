module "stage" {
source = "../01_test"

  name      = "Son"
  region    = "ap-northeast-2"
  ava       = ["a", "c"]
  key       = "Son2-key"
  cidr_main = "10.0.0.0/16"
  cidr_public = [
    "10.0.0.0/24",
    "10.0.2.0/24"
  ]
  cidr_pri = [
    "10.0.1.0/24",
    "10.0.3.0/24"
  ]
  cidr_pridb = [
    "10.0.4.0/24",
    "10.0.5.0/24"
  ]
  cidr_route       = "0.0.0.0/0"
  allow_http       = "allow HTTP"
  protocol_http    = "HTTP"
  allow_ssh        = "allow ssh"
  allow_mysql      = "allow mysql"
  allow_icmp       = "allow icmp"
  HTTP             = 80
  SSH              = 22
  MYSQL            = 3306
  port             = 0
  protocol_tcp     = "tcp"
  protocol_icmp    = "icmp"
  ipv6             = "::/0"
  ami-id           = "ami-04e8dfc09b22389ad"
  instance_type    = "t2.micro"
  instance_pri     = "10.0.0.11"
  db_engine        = "mysql"
  db_version       = "8.0"
  db_name          = "test"
  db_inentifier    = "test"
  db_user_name     = "root"
  db_user_password = "thsdud1933"

}
