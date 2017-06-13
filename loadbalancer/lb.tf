resource "fastly_service_v1" "default" {
  name = "nomaddemo"

  domain {
    name    = "nomad.demo.gs"
    comment = "nomad demo"
  }

  backend {
    address = "${var.aws_lb}"
    name    = "AWS"
    port    = 80
  }

  backend {
    address = "${var.gcp_lb}"
    name    = "GCP"
    port    = 80
  }

  cache_setting {
    name   = "nocache"
    action = "pass"
  }

  force_destroy = true
}
