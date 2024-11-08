# module "frontend" {
#   depends_on = [module.backend]

#   source          = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git"
#   instance_type   = var.components["frontend"]["instance_type"]
#   name            = var.components["frontend"]["name"]
#   env             = var.env
#   port_no         = var.components["frontend"]["port_no"]
#   ssh_pwd         = var.ssh_pwd
#   vault_token     = var.vault_token
#   prometheus_node = var.prometheus_node
#   # zone_id         = data.aws_route53_zone.main.zone_id
#   # ami             = data.aws_ami.main.image_id
# }


# module "backend" {
#   depends_on = [module.mysql]

#   source          = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git"
#   instance_type   = var.components["backend"]["instance_type"]
#   name            = var.components["backend"]["name"]
#   env             = var.env
#   port_no         = var.components["backend"]["port_no"]
#   ssh_pwd         = var.ssh_pwd
#   vault_token     = var.vault_token
#   prometheus_node = var.prometheus_node
#   # zone_id         = data.aws_route53_zone.main.zone_id
#   # ami             = data.aws_ami.main.image_id
# }

# module "mysql" {
#   source          = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git"
#   instance_type   = var.components["mysql"]["instance_type"]
#   name            = var.components["mysql"]["name"]
#   env             = var.env
#   port_no         = var.components["mysql"]["port_no"]
#   ssh_pwd         = var.ssh_pwd
#   vault_token     = var.vault_token
#   prometheus_node = var.prometheus_node
#   # zone_id         = data.aws_route53_zone.main.zone_id
#   # ami             = data.aws_ami.main.image_id
# }


# Creates VPC

module "vpc" {
  source   = "git::https://github.com/B58-CloudDevOps/tf-module-vpc.git"
  for_each = var.vpc


  vpc_cidr_block  = each.value["vpc_cidr_block"]
  lb_subnet_cidr  = each.value["lb_subnet_cidr"]
  eks_subnet_cidr = each.value["eks_subnet_cidr"]
  db_subnet_cidr  = each.value["db_subnet_cidr"]
  azs             = each.value["azs"]
  env             = var.env
  tags            = var.tags

  default_vpc_id   = each.value["default_vpc_id"]
  default_vpc_cidr = each.value["default_vpc_cidr"]
  default_vpc_rt   = each.value["default_vpc_rt"]

}

# Creates EKS
module "eks" {
  source   = "git::https://github.com/B58-CloudDevOps/tf-module-eks.git"
  for_each = var.eks

  env         = var.env
  tags        = var.tags
  eks_version = var.eks_version

  subnet_ids = module.vpc["main"].eks_subnet_ids

}