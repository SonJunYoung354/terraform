## add ec2 
/*
data "aws_ami" "Son_ami" {
    most_recent = true

    filter {
      name = "name"
      values = ["amaz-ami-hvm-*-x86_64-gp2"]
    }
    filter {
        name = "name"
        values = ["hvm"]
    }

    owners = ["amazon"]
}
*/

resource "aws_instance" "Son_web" {
  ## ami code
  ## instance_type
  ## "aws_key_pair" "Son_key" = key name
  ## vpc_security_group id 
  ## private_ip
  ## user_data = file
  ## subnet public a id 
  ami                    = "ami-04e8dfc09b22389ad"
  instance_type          = "t2.micro"
  key_name               = "Son2-key"
  vpc_security_group_ids = [aws_security_group.Son_sg.id]
  availability_zone      = "ap-northeast-2a"
  private_ip             = "10.0.0.11"
  user_data = file("../../intall.sh")
  subnet_id = aws_subnet.Son_puba.id
  tags = {
    "Name" = "Son_terrafrom_web"
  }
}


## user_data 
/*user_data = <<-EOF
                #!/bin/bash
                sudo su -
                yum install -y httpd
                echo "SDKIM-Terraform-1" >> /var/www/html/index.html
                systemctl start httpd
                EOF
}
*/

## add  public ip 
resource "aws_eip" "Son_eip" {
  vpc                       = true
  instance                  = aws_instance.Son_web.id
  associate_with_private_ip = "10.0.0.11"
  depends_on = [
    aws_internet_gateway.Son_ig
  ]
  tags = {
    Name = "Son_web"
  }
}
# add ouput public ip
output "public_ip" {
  value = aws_instance.Son_web.public_ip

}
