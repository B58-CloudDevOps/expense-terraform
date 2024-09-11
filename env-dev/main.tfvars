env = "dev"
components = {
  frontend = {
    name          = "frontend"
    instance_type = "t3.small"
    port_no       = 80
  }

  mysql = {
    name          = "mysql"
    instance_type = "t3.micro"
    port_no       = 3306
  }

  backend = {
    name          = "backend"
    instance_type = "t3.small"
    port_no       = 8080
  }
}

prometheus_node = ["172.31.85.80/32"]