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