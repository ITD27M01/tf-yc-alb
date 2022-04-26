output "lb" {
  description = "LoadBalancer object"
  value       = yandex_alb_load_balancer.this
}

output "lb_router_id" {
  description = "LoadBalancer router ID"
  value       = yandex_alb_http_router.this.id
}

output "fqdn" {
  description = "LoadBalancer FQDN"
  value       = yandex_dns_recordset.this.name
}