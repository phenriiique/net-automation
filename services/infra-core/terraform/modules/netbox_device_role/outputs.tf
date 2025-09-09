output "id" {
  description = "ID do role do device criado"
  value       = netbox_device_role.this.id
}

output "name" {
  description = "Nome do role do device"
  value       = netbox_device_role.this.name
}

output "slug" {
  description = "Slug do role do device"
  value       = netbox_device_role.this.slug
}

output "color_hex" {
  description = "Cor hexadecimal do role do device"
  value       = netbox_device_role.this.color_hex
}

output "description" {
  description = "Descrição do role do device"
  value       = netbox_device_role.this.description
}
