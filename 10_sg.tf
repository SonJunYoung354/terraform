
## add security_group
##prefix_list_ids = null
##security_groups = null
##self = null
resource "aws_security_group" "Son_sg" {
    name = "allow Basic"
    description = "Allow HTTP,SSH,SQL,ICMP"
    vpc_id = aws_vpc.Son-vpc.id


    ingress = [
        {
            description = "allow HTTP"
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks  = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids = null
            security_groups = null
            self = null

        },
        {
          description = "allow ssh"
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
          ipv6_cidr_blocks = ["::/0"]
          prefix_list_ids = null
          security_groups = null
          self = null
        },
        {
          description = "allow mysql"
          from_port   = 3306
          to_port     = 3306
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
          ipv6_cidr_blocks = ["::/0"]
          prefix_list_ids = null
          security_groups = null
          self = null
        },
        {
          description = "allow icmp"
          from_port   = 3389
          to_port     = 3389
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
          ipv6_cidr_blocks = ["::/0"]
          prefix_list_ids = null
          security_groups = null
          self = null
        }
    ]
    egress = [
        {
            description = "all"
            from_port = 0
            to_port   = 0
            protocol  = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
            prefix_list_ids = null
            security_groups = null
            self = null
        }
    ]

    tags = {
      "Name" = "Son-sg"
    }
}