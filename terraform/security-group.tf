#--------------------------------------------------------------
# AWS SG FOR ALB
#--------------------------------------------------------------

module "demo_alb_sg_us_west_1" {
  source = "terraform-aws-modules/security-group/aws"
  version = "v5.0"
  name = var.demo_alb_sg_us_west_1
  vpc_id = module.demo_vpc_us_west_1.vpc_id

  ingress_with_cidr_blocks = [
    {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = "0.0.0.0/0"
  }
  ]
  egress_with_cidr_blocks = [ {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = "0.0.0.0/0"} ]

}