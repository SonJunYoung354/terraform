## add security_group
##prefix_list_ids = null
##security_groups = null
##self = null
## count 만큼 실행 
# count = length(var.allow_mode)
resource "aws_security_group" "Son_sg" {
  name        = "allow Basic"
  description = "Allow HTTP,SSH,SQL,ICMP"
  vpc_id      = aws_vpc.Son-vpc.id
  ingress = [
    {
      description      = var.allow_http
      from_port        = var.HTTP
      to_port          = var.HTTP
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.ipv6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null

    },
    {
      description      = var.allow_ssh
      from_port        = var.SSH
      to_port          = var.SSH
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.ipv6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.allow_mysql
      from_port        = var.MYSQL
      to_port          = var.MYSQL
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.ipv6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.allow_icmp
      from_port        = var.port
      to_port          = var.port
      protocol         = var.protocol_tcmp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.ipv6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]
  egress = [
    {
      description      = "all"
      from_port        = var.port
      to_port          = var.port
      protocol         = "-1"
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.ipv6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  tags = {
    "Name" = "${var.name}-sg"
  }
}


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
  ami                    = var.ami-id
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.Son_sg.id]
  availability_zone      = "${var.region}${var.ava[0]}"
  private_ip             = var.instance_pri
  user_data              = file("../../intall.sh")
  subnet_id              = aws_subnet.Son_pub[0].id
  tags = {
    "Name" = "${var.name}_terrafrom_web"
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
  associate_with_private_ip = var.instance_pri
  depends_on = [
    aws_internet_gateway.Son_ig
  ]
  tags = {
    Name = "${var.name}_web"
  }
}
# add ouput public ip
output "public_ip" {
  value = aws_instance.Son_web.public_ip

}
