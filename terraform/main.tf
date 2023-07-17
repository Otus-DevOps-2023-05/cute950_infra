terraform {
  required_version = ">= 0.13.0"
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}
provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_compute_instance" "app" {
  name = "reddit-app-terraform"
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  resources {
    cores  = 2
    core_fraction = 5
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }
  zone = var.zone
  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  connection {
    type        = "ssh"
    host        = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }
  load_balancer {
    target_group_name = "reddit_group"
  }
  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}
