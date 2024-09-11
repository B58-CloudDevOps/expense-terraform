variable "components" {}
variable "env" {}
variable "ssh_pwd" {}
variable "vault_token" {}
variable "prometheus_node" {}
variable "zone_id" {
  default = data.aws_route53_zone.main.zone_id
}

variable "ami" {
  default = data.aws_ami.main.image_id
}