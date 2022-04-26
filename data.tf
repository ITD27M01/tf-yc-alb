data "yandex_vpc_network" "this" {
  network_id = var.lb_network_id
}

data "yandex_vpc_subnet" "lb" {
  name      = var.lb_subnet_name
  folder_id = var.folder_id
}

data "yandex_dns_zone" "public" {
  name      = "${replace(trim(var.lb_subnet_name, "."), ".", "-")}-public"
  folder_id = var.folder_id
}
