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
  default = ["us-west-1a"]
}

variable "private_subnets_west" {
  type = list(string)
  description = "The list of private subnets for the first VPC"
  default = ["10.1.1.0/24"]
}

variable "public_subnets_west" {
  type = list(string)
  description = "The list of public subnets for the first VPC"
  default = ["10.1.101.0/24"]
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