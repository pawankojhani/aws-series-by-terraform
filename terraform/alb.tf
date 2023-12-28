module "demo_alb_us_west" {
    source = "terraform-aws-modules/alb/aws"
    version = "v8.7.0"
    name = var.demo_alb_us_west
    subnets = module.demo_vpc_us_west_1.public_subnets
    create_security_group = false
    security_groups = [module.demo_alb_sg_us_west_1.security_group_id]
    vpc_id = module.demo_vpc_us_west_1.vpc_id
    idle_timeout = 90
    http_tcp_listeners = [{
    port = 80
    protocol = "HTTP"
    action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = aws_acm_certificate.cert.arn 
      target_group_index = 0
    }
  ]

    target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = var.DEMO_HTTP_PORT
      target_type      = "ip"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/"
        port                = var.DEMO_HTTP_PORT
        healthy_threshold   = 5
        unhealthy_threshold = 2
        timeout             = 5
        protocol            = "HTTP"
        matcher             = "200"
      }      
    }
  ]
  
}