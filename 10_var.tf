
variable "name" {
    type = string
    default = "Son"
}


variable "region" {
    type =  string
    default = "ap-northeast-2"
}

variable "key" {
    type = string
    default = "Son2-key" 
}

variable "cidr_main" {
    type = string
    default = "10.0.0.0/16"
}


variable "ava" {
    type = list(string)
    default = [
        "a",
        "c"
    ]
  
}
variable "cidr_public" {
    type = list(string)
    default = ["10.0.0.0/24","10.0.2.0/24"]

}

variable "cidr_pri" {
  type = list(string)
  default = [ 
      "10.0.1.0/24",
      "10.0.3.0/24"
   ]
}

variable "cidr_pridb" {
    type = list(string)
    default = [
        "10.0.4.0/24",
        "10.0.5.0/24"
     ]
  
}
##
## 04~09

variable "cidr_route" {
    type = string
    default = "0.0.0.0/0"
}


## 10 ~ 11

/*variable "sg_cidr" {
    type = string
    default = "0.0.0.0/0"
  
}
# count = length(var.cidr_public)

*/
/*
variable "allow_mode" {
    type = list(string)
    default = [ 
        "allow HTTP",
        "allow ssh",
        "allow mysql",
        "allow icmp",
        "allow all"
     ]
  
}
*/
variable "allow_http" {
    type = string
    default = "allow HTTP"
  
}
variable "protocol_http" {
    type = string
    default = "HTTP"
  
}
variable "allow_ssh" {
    type = string
    default = "allow ssh"
  
}
variable "allow_mysql" {
    type = string
    default = "allow mysql"
  
}
variable "allow_icmp" {
    type = string
    default = "allow imcp"
  
}


variable "HTTP" {
    type = number
    default = 80 
}
variable "SSH" {
    type = number
    default = 80 
}


variable "MYSQL" {
    type = number
    default = 3306
}

variable "port" {
    type = number
    default = 0
}
variable "protocol_tcp" {
  type = string
  default = "tcp"
}

variable "protocol_tcmp" {
  type = string
  default = "icmp"
}
variable "ipv6" {
    type = string
    default = "::/0" 
}

variable "ami-id" {
    type = string
    default = "ami-04e8dfc09b22389ad"

}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "instance_pri" {
    type = string
    default = "10.0.0.11"
  
}

## 12 ~ 21

variable "db_engine" {
    type = string
    default = "mysql"
}

variable "db_version" {
    type = string
    default = "8.0"
}

variable "db_name" {
    type = string
    default = "test"
}

variable "db_inentifier" {
    type = string
    default = "test"
}

variable "db_user_name" {
    type = string
    default = "root"
}

variable "db_user_password" {
    type = string
    default = "thsdu1933"
}