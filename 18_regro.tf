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
