##
## 16 ~ 20
resource "aws_ami_from_instance" "Son_ami" {
  name               = "Son_web1_ami"
  source_instance_id = aws_instance.Son_web.id
  depends_on = [
    ## Antecedent ec2
    aws_instance.Son_web
  ]
}

## print ami_id 
output "ami_id" {
  value = aws_ami_from_instance.Son_ami.id
}


##
## add aws_launch_configuration
resource "aws_launch_configuration" "Son_aslc" {
  name_prefix          = "Son_web*"
  image_id             = aws_ami_from_instance.Son_ami.id
  instance_type        = var.instance_type
  iam_instance_profile = "Son_role"
  security_groups      = [aws_security_group.Son_sg.id]
  key_name             = var.key
  #    user_data = file("../../intall.sh")

  lifecycle {
    create_before_destroy = true
  }
}

output "autolg" {
  value = aws_launch_configuration.Son_aslc.arn
}



##
## placement_group 
# strategy = cluster
resource "aws_placement_group" "Son_place_group" {
  name     = "Son_place"
  strategy = "cluster"
}

output "tags_all" {
  value = aws_placement_group.Son_place_group.tags_all
}


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
  vpc_zone_identifier       = [aws_subnet.Son_pub[0].id, aws_subnet.Son_pub[1].id]
  tags = [{
    "Name" = "${var.name}-web123"
  }]
}


output "auto" {
  value = [
    aws_autoscaling_group.Son_aug.availability_zones,
    aws_autoscaling_group.Son_aug.desired_capacity
  ]
}


##
## add aws_autoscaling_attachment
resource "aws_autoscaling_attachment" "Son_autoattach" {
  autoscaling_group_name = aws_autoscaling_group.Son_aug.id
  alb_target_group_arn   = aws_lb_target_group.Son_target.arn

}
