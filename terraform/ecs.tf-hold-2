module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = var.demo_cluster_us_west

  cluster_configuration = {
    execute_command_configuration = {
      logging = "OVERRIDE"
      log_configuration = {
        cloud_watch_log_group_name = "/aws/ecs/demo-log"
      }
    }
  }

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

  services = {
    ecsdemo-frontend = {
      cpu    = 1024
      memory = 4096

      # Container definition(s)
      container_definitions = {

        fluent-bit = {
          cpu       = var.demo_ecs_container_cpu
          memory    = var.demo_ecs_container_memory
          essential = true
          image     = "906394416424.dkr.ecr.us-west-2.amazonaws.com/aws-for-fluent-bit:stable"
          firelens_configuration = {
            type = "fluentbit"
          }
          memory_reservation = 50
        }

        ecs-sample = {
          cpu       = var.demo_ecs_container_cpu
          memory    = var.demo_ecs_container_memory
          essential = true
          image     = "public.ecr.aws/aws-containers/ecsdemo-frontend:776fd50"
          port_mappings = [
            {
              name          = "ecs-sample"
              containerPort = var.DEMO_HTTP_PORT
              protocol      = "tcp"
            }
          ]

          # Example image used requires access to write to root filesystem
          readonly_root_filesystem = false

          dependencies = [{
            containerName = "fluent-bit"
            condition     = "START"
          }]

          enable_cloudwatch_logging = false
          log_configuration = {
            logDriver = "awsfirelens"
            options = {
              Name                    = "firehose"
              #region                  = "eu-west-1"
              delivery_stream         = "my-stream"
              log-driver-buffer-limit = "2097152"
            }
          }
          memory_reservation = 100
        }
      }

      service_connect_configuration = {
        namespace = "example"
        service = {
          client_alias = {
            port     = var.DEMO_HTTP_PORT
            dns_name = "ecs-sample"
          }
          port_name      = "ecs-sample"
          discovery_name = "ecs-sample"
        }
      }

      load_balancer = {
        service = {
          target_group_arn = element(module.demo_alb_us_west.target_group_arns, 0)
          container_name   = "ecs-sample"
          container_port   = var.DEMO_HTTP_PORT
        }
      }

      subnet_ids = module.demo_vpc_us_west_1.private_subnets
      security_group_rules = {
        alb_ingress_3000 = {
          type                     = "ingress"
          from_port                = var.DEMO_HTTP_PORT
          to_port                  = var.DEMO_HTTP_PORT
          protocol                 = "tcp"
          description              = "Service port"
          source_security_group_id = module.demo_alb_sg_us_west_1.security_group_id
        }
        egress_all = {
          type        = "egress"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }
  }

  tags = {
    Environment = "Development"
    Project     = "Example"
  }
}