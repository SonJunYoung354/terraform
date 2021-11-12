##
##
resource "aws_autoscaling_group" "Son_aug" {
  name                      = "Son-auto"
  min_size                  = 2
  max_size                  = 10
  health_check_grace_period = 10
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.Son_aslc.name
  vpc_zone_identifier       = [aws_subnet.Son_puba.id, aws_subnet.Son_pubc.id]
  tags = [{
    "Name" = "Son-web123"
  }]
}


output "auto" {
  value = [
    aws_autoscaling_group.Son_aug.availability_zones,
    aws_autoscaling_group.Son_aug.desired_capacity
  ]
}
