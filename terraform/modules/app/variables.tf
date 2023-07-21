variable "private_key_path" {
  description = "private_key_path"
}

variable "public_key_path" {
  description = "public_key_path"
}

variable "subnet_id" {
  description = "subnet_id"
}

variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable "db_ip" {
  description = "database IP"
}
