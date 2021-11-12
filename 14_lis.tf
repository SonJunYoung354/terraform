## add lb_listener
## and vs id
resource "aws_lb_listener" "Son_list" {
  load_balancer_arn = aws_lb.Son_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Son_target.arn
  }

}
