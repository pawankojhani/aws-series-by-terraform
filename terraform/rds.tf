module "demo_db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = var.mysql_us_west

  engine            = var.mysql_engine
  engine_version    = var.mysql_version
  instance_class    = var.mysql_instance_type
  allocated_storage = 5

  db_name  = var.mysql_demo_name
  username = var.mysql_user
  port     = var.mysql_port

  iam_database_authentication_enabled = true

  #vpc_security_group_ids = module.demo_rds_sg_us_west.vpc_security_group_ids

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "DevOps"
    Environment = "demo"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = module.demo_vpc_us_west_1.private_subnets

  # DB parameter group
  family = var.mysql_parameter_group

# DB option group
  major_engine_version = "5.7"

  # Database Deletion Protection
  # deletion_protection = true

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}