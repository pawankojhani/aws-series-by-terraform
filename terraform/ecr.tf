## Create ECR repository
resource "aws_ecr_repository" "ecr_us_west" {
  name = var.demo_ecr
  force_delete = true
}