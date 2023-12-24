module "demo_vpc_us_west_1" {
  source = "terraform-aws-modules/vpc/aws"
  name = var.demo_vpc_us_west
  cidr = var.demo_us_west_1_cidr
  enable_dns_hostnames = true
  azs = var.azs1
  private_subnets = var.private_subnets_west
  public_subnets = var.public_subnets_west
  enable_nat_gateway = true
  
  tags = {
    Terraform = "true"
    Environment = "demo"
  }

}
