##
## add aws_autoscaling_attachment
resource "aws_autoscaling_attachment" "Son_autoattach" {
  autoscaling_group_name = aws_autoscaling_group.Son_aug.id
  alb_target_group_arn   = aws_lb_target_group.Son_target.arn

}
