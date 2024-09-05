module "frontend" {
    depends_on = [ module.backend ]
  source = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git" 
  instance_type = 
    name = 
    env = 
    port_no
}

module "backend" { 
    depends_on = [ module.mysql ]
  source = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git" 
  instance_type = 
    name = 
    env = 
    port_no
}

module "mysql" {
  source = "git::https://github.com/B58-CloudDevOps/tf-module-terraform.git" 
  instance_type = 
    name = 
    env = 
    port_no
}