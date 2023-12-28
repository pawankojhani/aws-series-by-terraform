
resource "aws_acm_certificate" "demo" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = {
    Environment = "devops-demo"
  }

  lifecycle {
    create_before_destroy = true
  }
   tags = {
    Name = var.domain_name
  } 
}




