## add lb_target_group_attach

## add target_group_arn
## add target_id = instance.id
resource "aws_lb_target_group_attachment" "Son_tgatt" {
  target_group_arn = aws_lb_target_group.Son_target.arn
  target_id        = aws_instance.Son_web.id
  port             = 80

}
