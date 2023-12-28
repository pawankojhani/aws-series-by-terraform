resource "aws_cloudwatch_log_group" "ecs_log_group_west" {
  name              = "/ecs/${var.demo_ecs_service_us_west}/${var.demo_ecs_container_us_west}"
  retention_in_days = 90
}