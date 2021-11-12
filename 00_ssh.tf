resource "aws_key_pair" "Son_key" {
  key_name = "Son2-key"
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfXqBihYv757doCfQHCm2JKjqrBTGlYJDUC7AQenFdYYdFn1RRF9y+BkvCPTKLnR/heveBxapmp7YAuLv/MvMThSYtKAWm7TqDAeih9yQX4zfwisGlFxXeQ+o76m8QG7CnN8zuQsKzDCJlQY2b/ybugfHeTCQBYizi2SAGSRMNy6yl6X4ArdHEz0BG/XyYF6iMN9Euv+8tXY6ODwv4OqKX7sYB4f6zl475dn7UvAuHtG7tJhWVKtBwGV2MfndXJg6UqtCrW+0DpBaWb0LZ/CZpfpkZGXoTlgC625dCzLcuu4RvRaD+bgY3LvgNtGQa1LSsdiOxKNoVNLYD+F0ax6L04rUbbgzudwodg5AFo/I9rjcZSz4r38e99/+Tvpyi9dKaETQaIKNEeL0+JF1j4tDGndtUr4bko2VIcDLKbkH2VBcQBp2AKDhlkO/1JzuzUtuH/EnWFm8MdAumYfcRY1/NBVtj40t//M3A4QIpgXhiK/lN3BUbY7fE1Fssp/0I7Yk="
  public_key = file("../../.ssh/Son-key.pub")
}
