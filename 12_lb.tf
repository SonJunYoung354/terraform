## add load_balancer
## type : application
resource "aws_lb" "Son_lb" {
    name      = "web-lb"
    internal  = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.Son_sg.id] 
    subnets = [aws_subnet.Son_puba.id,aws_subnet.Son_pubc.id]  

  tags = {
    "Name" = "Son_web_lb"
  }
}

## add output dns.name
output "al_dns" {
  value = aws_lb.Son_lb.dns_name
}