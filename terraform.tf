module "gcp" {
  source = "./gcp"

  namespace = "${var.namespace}"

  nomad_servers = "${var.nomad_servers}"
  nomad_agents  = "${var.nomad_agents}"

  consul_enabled        = true
  consul_version        = "${var.consul_version}"
  consul_join_tag_key   = "${var.consul_join_tag_key}"
  consul_join_tag_value = "${var.consul_join_tag_value}"
  consul_wan            = "consul.demo.gs"

  nomad_enabled = true
  nomad_version = "${var.nomad_version}"

  hashiui_enabled = false
  hashiui_version = "${var.hashiui_version}"
}

module "aws" {
  source = "./aws"

  namespace = "${var.namespace}"

  nomad_servers = "${var.nomad_servers}"
  nomad_agents  = "${var.nomad_agents}"

  consul_enabled        = true
  consul_version        = "${var.consul_version}"
  consul_join_tag_key   = "${var.consul_join_tag_key}"
  consul_join_tag_value = "${var.consul_join_tag_value}"

  nomad_enabled = true
  nomad_version = "${var.nomad_version}"

  hashiui_enabled = false
  hashiui_version = "${var.hashiui_version}"

  vpc_id  = "vpc-864193e1"
  subnets = ["subnet-efd80888", "subnet-7773ac3e"]
}

module "loadbalancer" {
  source                = "./loadbalancer"
  fastly_api_key        = "${var.fastly_api_key}"
  aws_lb                = "${module.aws.alb_dns}"
  gcp_lb                = "${module.gcp.alb_dns}"
  alb_internal_dns_name = "${module.aws.alb_internal_dns}"
  alb_internal_zone_id  = "${module.aws.alb_internal_zone_id}"
  route53_zone          = "${var.route53_zone}"
}

module "datadog" {
  source = "./datadog"
}
