variable "region" {
  type = string
  description = "The AWS region for the first VPC"
  default = "us-west-1"
}

variable "demo_vpc_us_west" {
  type = string
  description = "VPC Name"
  default = "demo-vpc-us-west"
}

variable "demo_us_west_1_cidr" {
  type = string
  description = "The CIDR block for the first VPC"
  default = "10.1.0.0/16"
}

variable "azs1" {
  type = list(string)
  description = "The list of AZs for the first VPC"
  default = ["us-west-1a", "us-west-1c"]
}

variable "private_subnets_west" {
  type = list(string)
  description = "The list of private subnets for the first VPC"
  default = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "public_subnets_west" {
  type = list(string)
  description = "The list of public subnets for the first VPC"
  default = ["10.1.101.0/24", "10.1.102.0/24"]
}

variable "demo_alb_sg_us_west_1" {
  type = string
  description = "The name of the ALB security group"
  default = "demo-alb-sg-west-1"
}

variable "domain_name" {
  type = string
  description = "This is for domain name"
  default = "devopswithpawan.com"
}

variable "demo_alb_us_west" {
  type = string
  description = "The name of the first ALB"
  default = "demo-alb-us-west"
}

variable "DEMO_HTTP_PORT" {
  type        = number
  description = "HTTP_PORT parameter"
  default     = 80
}

variable "demo_ecr" {
  type        = string
  description = "Demo ECR Name"
  default     = "devops-demo-ecr"
}

variable "demo_cluster_us_west" {
  type = string
  description = "The name of the first ECS cluster"
  default = "demo-cluster-west-1"
}

variable "demo_ecs_service_us_west" {
  type = string
  description = "The name of the first ECS service"
  default = "demo-web-west-1"
}

variable "demo_ecs_container_cpu" {
  type = number
  description = "The number of CPU units for the ECS container"
  default = 256
}

variable "demo_ecs_container_memory" {
  type = number
  description = "The amount of memory for the ECS container"
  default = 512
}

variable "demo_ecs_container_us_west" {
  type = string
  description = "The name of the first ECS container"
  default = "demo-web-container-west-1"
}

variable "mysql_us_west" {
  type = string
  description = "The name of the first RDS for Demo"
  default = "demo-instance"
}

variable "mysql_engine" {
  type = string
  description = "DB ENGINE"
  default = "mysql"
}

variable "mysql_version" {
  type = string
  description = "The name of the RDS version"
  default = "5.7"
}

variable "mysql_instance_type" {
  type = string
  description = "The name of the RDS version"
  default = "db.t3.micro"
}

variable "mysql_demo_name" {
  type = string
  description = "The name of the RDS version"
  default = "dbdemo"
}

variable "mysql_user" {
  type = string
  description = "The name of the RDS version"
  default = "user"
}

variable "mysql_port" {
  type = string
  description = "The name of the RDS version"
  default = "3306"
}

variable "mysql_sg_name" {
  type = string
  description = "The name of the RDS version"
  default = "demo-rds-sg"
}

variable "mysql_parameter_group" {
  type = string
  description = "The name of the RDS version"
  default = "mysql5.7"
}

variable "demo_rds_sg_us_west" {
  type = string
  description = "The name of the ALB security group"
  default = "demo-rds-sg-west-1"
}

########### IAM GROUPS #############
# List of IAM group names
variable "iam_devops_admin_group" {
  default = ["Admin"]
}

variable "existing_iam_user_names" {
  default = ["demo-devops" , "devops"]
}
