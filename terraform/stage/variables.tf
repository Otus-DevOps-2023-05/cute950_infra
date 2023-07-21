variable "cloud_id" {
  description = "cloud_id"
}
variable "folder_id" {
  description = "folder_id"
}
variable "zone" {
  description = "zone"
  default     = "ru-central1-a"
}
variable "private_key_path" {
  description = "private_key_path"
}
variable "public_key_path" {
  description = "public_key_path"
}
variable "image_id" {
  description = "image_id"
}
variable "subnet_id" {
  description = "subnet_id"
}
variable "token" {
  description = "token"
}
variable "instances_count" {
  description = "count of instances"
  default     = 1
}

variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable "db_disk_image" {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
