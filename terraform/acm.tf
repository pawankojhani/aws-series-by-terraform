module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = var.domain_name
  zone_id     = var.zone_id

  validation_method = "DNS"

  subject_alternative_names = [
    "*.devopswithpawan.com",
  ]

  create_route53_records  = false
  validation_record_fqdns = [
    "_689571ee9a5f9ec307c512c5d851e25a.devopswithpawan.com",
  ]

  tags = {
    Name = var.domain_name
  }
}
