resource "yandex_lb_target_group" "reddit_app_group" {
  count = var.instances_count
  name = "reddit-app-group-${count.index}"
  region_id = "ru-central1"
  folder_id = var.folder_id

  dynamic "target" {
    for_each = yandex_compute_instance.app
    content {
      subnet_id = var.subnet_id
      address   = target.value.network_interface.0.ip_address
    }
  }
}

resource "yandex_lb_network_load_balancer" "reddit_app_balancer" {
  name = "reddit-app-balancer"
  region_id = "ru-central1"
  folder_id = var.folder_id

  listener {
    name = "reddit-app-listener"
    port = 8080
    target_port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.reddit_app_group.id

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}
