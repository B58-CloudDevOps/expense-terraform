
# components = {
#   frontend = {
#     name          = "frontend"
#     instance_type = "t3.small"
#     port_no       = 80
#   }

#   mysql = {
#     name          = "mysql"
#     instance_type = "t3.micro"
#     port_no       = 3306
#   }

#   backend = {
#     name          = "backend"
#     instance_type = "t3.small"
#     port_no       = 8080
#   }
# }

# prometheus_node = ["172.31.85.80/32"]

env = "dev"
vpc = {
  main = {
    vpc_cidr_block  = "10.0.0.0/16"
    web_subnet_cidr = ["10.0.0.0/24", "10.0.1.0/24"]
    app_subnet_cidr = ["10.0.2.0/24", "10.0.3.0/24"]
    db_subnet_cidr  = ["10.0.4.0/24", "10.0.5.0/24"]
  }
}

  