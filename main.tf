module "frontend" {
  depends_on = [module.backend]

  source        = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git"
  instance_type = var.components["frontend"]["instance_type"]
  name          = var.components["frontend"]["name"]
  env           = var.env
  port_no       = var.components["frontend"]["port_no"]
  PWD           = var.pwd
}

module "backend" {
  depends_on = [module.mysql]

  source        = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git"
  instance_type = var.components["backend"]["instance_type"]
  name          = var.components["backend"]["name"]
  env           = var.env
  port_no       = var.components["backend"]["port_no"]
  PWD           = var.pwd
}

module "mysql" {
  source        = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git"
  instance_type = var.components["mysql"]["instance_type"]
  name          = var.components["mysql"]["name"]
  env           = var.env
  port_no       = var.components["mysql"]["port_no"]
  PWD           = var.pwd
}