## add load_balancer
## type : application
## 12 ~ 15

resource "aws_lb" "Son_lb" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Son_sg.id]
  subnets            = [aws_subnet.Son_pub[0].id, aws_subnet.Son_pub[1].id]

  tags = {
    "Name" = "${var.name}_web_lb"
  }
}

## add output dns.name
output "al_dns" {
  value = aws_lb.Son_lb.dns_name
}



## add target group
## target_type : Default instance 

resource "aws_lb_target_group" "Son_target" {
  name        = "Son-target"
  port        = var.HTTP
  protocol    = var.protocol_http
  target_type = "instance"
  vpc_id      = aws_vpc.Son-vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/index.html"
    port                = "traffic-port"
    protocol            = var.protocol_http
    timeout             = 2
    unhealthy_threshold = 2

  }

}

## add lb_listener
## and vs id
resource "aws_lb_listener" "Son_list" {
  load_balancer_arn = aws_lb.Son_lb.arn
  port              = "80"
  protocol          = var.protocol_http

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Son_target.arn
  }

}


## add lb_target_group_attach

## add target_group_arn
## add target_id = instance.id
resource "aws_lb_target_group_attachment" "Son_tgatt" {
  target_group_arn = aws_lb_target_group.Son_target.arn
  target_id        = aws_instance.Son_web.id
  port             = var.HTTP

}

