##
## add aws_launch_configuration
resource "aws_launch_configuration" "Son_aslc" {
    name_prefix = "Son_web*"
    image_id = aws_ami_from_instance.Son_ami.id
    instance_type = "t2.micro"
    iam_instance_profile = "Son_role"
    security_groups = [aws_security_group.Son_sg.id]
    key_name = "Son2-key"
#    user_data = file("../../intall.sh")

    lifecycle {
      create_before_destroy = true
    }
}

output "autolg" {
    value = aws_launch_configuration.Son_aslc.arn
}