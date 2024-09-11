module "frontend" {
  depends_on = [module.backend]

  source          = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git"
  instance_type   = var.components["frontend"]["instance_type"]
  name            = var.components["frontend"]["name"]
  env             = var.env
  port_no         = var.components["frontend"]["port_no"]
  ssh_pwd         = var.ssh_pwd
  vault_token     = var.vault_token
  prometheus_node = var.prometheus_node
  # zone_id         = data.aws_route53_zone.main.zone_id
  # ami             = data.aws_ami.main.image_id

}



module "backend" {
  depends_on = [module.mysql]

  source          = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git"
  instance_type   = var.components["backend"]["instance_type"]
  name            = var.components["backend"]["name"]
  env             = var.env
  port_no         = var.components["backend"]["port_no"]
  ssh_pwd         = var.ssh_pwd
  vault_token     = var.vault_token
  prometheus_node = var.prometheus_node
  # zone_id         = data.aws_route53_zone.main.zone_id
  # ami             = data.aws_ami.main.image_id
}

module "mysql" {
  source          = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git"
  instance_type   = var.components["mysql"]["instance_type"]
  name            = var.components["mysql"]["name"]
  env             = var.env
  port_no         = var.components["mysql"]["port_no"]
  ssh_pwd         = var.ssh_pwd
  vault_token     = var.vault_token
  prometheus_node = var.prometheus_node
  # zone_id         = data.aws_route53_zone.main.zone_id
  # ami             = data.aws_ami.main.image_id
}

# variable "vault_token" {}