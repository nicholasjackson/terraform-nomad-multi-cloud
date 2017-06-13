output "alb_dns" {
  value = "${google_compute_global_address.external-address.address}"
}
