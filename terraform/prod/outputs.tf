output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}

# output "external_ip_address_app" {
#   value = [for instance in yandex_compute_instance.app : instance.network_interface.0.nat_ip_address]
# }

# output "reddit-app-balancer_ip_address" {
#   value = [for listener in yandex_lb_network_load_balancer.reddit_app_balancer.listener: listener.external_address_spec.0.address].0
# }
