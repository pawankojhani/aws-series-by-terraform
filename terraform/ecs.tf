module "demo_cluster_us_west_1" {
  source = "terraform-aws-modules/ecs/aws"
  cluster_name = var.demo_ecs_service_us_west
  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
    FARGATE_SPOT = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
  }
}
module "cardsecure_ecs_service_us_west_1" {
  source = "terraform-aws-modules/ecs/aws//modules/service"
  name = var.demo_ecs_container_us_west
  cluster_arn = module.demo_cluster_us_west_1.cluster_arn
  cpu = var.demo_ecs_container_cpu
  memory = var.demo_ecs_container_memory
#  task_exec_iam_role_name = aws_iam_role.ecs_task_execution_role.name
#  task_exec_iam_role_arn = aws_iam_role.ecs_task_execution_role.arn
#  tasks_iam_role_name = aws_iam_role.ecs_task_role.name
#  tasks_iam_role_arn = aws_iam_role.ecs_task_role.arn
# create_task_exec_iam_role = false
#  create_task_exec_policy = false
#  create_tasks_iam_role = false
#  create_security_group = false
  container_definitions = {
    "${var.demo_ecs_container_us_west}" = {
      image = "${aws_ecr_repository.ecr_us_west.repository_url}:latest"
      port_mappings = [{
        containerPort = var.DEMO_HTTP_PORT,
        hostPort      = var.DEMO_HTTP_PORT
      }]
      log_configuration = {
        log_driver = "awslogs"
        options    = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs_log_group_west.name
#         "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "/ecs/${var.demo_ecs_service_us_west}/${var.demo_ecs_container_us_west}"
        }
#      task_exec_iam_role_name = aws_iam_role.ecs_task_execution_role.name
#      tasks_iam_role_name = aws_iam_role.ecs_task_role.name
      }

  }
  }
  security_group_ids = [module.demo_alb_sg_us_west_1.security_group_id]
  subnet_ids = module.demo_vpc_us_west_1.private_subnets
  load_balancer = {
    service = {
      target_group_arn = element(module.demo_alb_us_west.target_group_arns,0)
      container_name   = var.demo_ecs_container_us_west
      container_port   = var.DEMO_HTTP_PORT
    }
  }
}












