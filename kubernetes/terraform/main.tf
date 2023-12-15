terraform {
  required_version = ">= 0.13.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.94.0"
    }
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
  token = var.token
}

resource "yandex_compute_instance" "app" {
  count = var.count_instance
  name = "node-app-${count.index}"
  platform_id = "standard-v3"

  resources {
    cores  = 4
    memory = 4
  }

  metadata = {
    service_account_name = var.service_account_name
    service_account_id = var.service_account_id
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 40
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = var.service_account_name
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }
}
