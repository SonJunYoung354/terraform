resource "aws_iam_role" "Son_role" {
    name = "Son-role12"


    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement  = [
            {
                Action = "*",
                Effect = "Allow",
                resource = "*"
            }
        ]
    })

    tags = {
        tag-key = "Snn11"
    }
  
}

output "role-output" {
    value = [
        aws_iam_role.Son_role.id,
        aws_iam_role.Son_role.name,
        aws_iam_role.Son_role.tags_all
    ]
}