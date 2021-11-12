##
##
resource "aws_ami_from_instance" "Son_ami" {
    name = "Son_web1_ami"
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