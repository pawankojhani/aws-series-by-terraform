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
  default = ["us-west-1a", "us-west-1b"]
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