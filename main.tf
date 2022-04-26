resource "yandex_alb_load_balancer" "this" {
  name = var.lb_name

  folder_id = var.folder_id

  network_id = var.lb_network_id

  allocation_policy {
    location {
      zone_id   = data.yandex_vpc_subnet.lb.zone
      subnet_id = data.yandex_vpc_subnet.lb.id
    }
  }

  listener {
    name = "${var.lb_name}-tls-listener"
    endpoint {
      address {
        external_ipv4_address { address = var.lb_external_ip }
      }

      ports = [var.lb_port]
    }
    tls {
      default_handler {
        http_handler {
          http_router_id = yandex_alb_http_router.this.id
        }
        certificate_ids = [var.lb_certificate_id]
      }
    }
  }

  labels = merge(local.labels, var.labels)
}

resource "yandex_alb_http_router" "this" {
  name      = var.lb_name
  folder_id = var.folder_id

  labels = merge(local.labels, var.labels)
}

resource "yandex_dns_recordset" "this" {
  zone_id = data.yandex_dns_zone.public.id
  name    = "*.${data.yandex_dns_zone.public.zone}"
  type    = "A"
  ttl     = 300
  data    = [yandex_alb_load_balancer.this.listener.0.endpoint.0.address.0.external_ipv4_address.0.address]
}