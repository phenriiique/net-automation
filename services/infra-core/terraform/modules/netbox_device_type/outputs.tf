output "id" {
  description = "ID do device type criado"
  value       = netbox_device_type.this.id
}

output "model" {
  description = "Modelo do device type"
  value       = netbox_device_type.this.model
}

output "manufacturer_id" {
  description = "ID do fabricante do device type"
  value       = netbox_device_type.this.manufacturer_id
}

output "part_number" {
  description = "Número da peça do device type"
  value       = netbox_device_type.this.part_number
}

output "u_height" {
  description = "Altura em unidades U do device type"
  value       = netbox_device_type.this.u_height
}

output "is_full_depth" {
  description = "Se o device type ocupa a profundidade completa do rack"
  value       = netbox_device_type.this.is_full_depth
}

