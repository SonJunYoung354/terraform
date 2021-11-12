##
##  Creative rds 
##  engine mysql 
resource "aws_db_instance" "Son_mysql" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  name                   = "test"
  identifier             = "test"
  username               = "root"
  password               = "thsdud1933"
  parameter_group_name   = "default.mysql8.0"
  availability_zone      = "ap-northeast-2a"
  db_subnet_group_name   = aws_db_subnet_group.Son_dbsn.id
  vpc_security_group_ids = [aws_security_group.Son_sg.id]
  skip_final_snapshot    = true
  ## add a role
  /*monitoring_role_arn = "Son_role.arn"
  ## log Property type set
  enabled_cloudwatch_logs_exports = [
    "error",
    "audit",
    "general",
    "slowquery"
  ]
  ##enabled_cloudwatch_logs_exports = ["error,audit,general,slowquery"]
  */

  tags = {
    "Nmae" = "Son_mydb"
  }
  depends_on = [
    aws_db_subnet_group.Son_dbsn
  ]
}


resource "aws_db_subnet_group" "Son_dbsn" {
  name       = "son-dbsb-group"
  subnet_ids = [aws_subnet.Son_pridba.id, aws_subnet.Son_pridbc.id]
  tags = {
    "Name" = "Sonweb_db_group"
  }

}

output "db-output" {
  value = [
    aws_db_instance.Son_mysql.name,
    aws_db_instance.Son_mysql.availability_zone,
    aws_db_instance.Son_mysql.port,
    aws_db_instance.Son_mysql.status

  ]

}
