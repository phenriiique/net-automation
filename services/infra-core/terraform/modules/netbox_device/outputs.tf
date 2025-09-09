output "id" {
  description = "ID do device criado"
  value       = netbox_device.this.id
}

output "name" {
  description = "Nome do device"
  value       = netbox_device.this.name
}

output "device_type_id" {
  description = "ID do tipo de device"
  value       = netbox_device.this.device_type_id
}

output "role_id" {
  description = "ID do role do device"
  value       = netbox_device.this.role_id
}

output "site_id" {
  description = "ID do site onde o device está localizado"
  value       = netbox_device.this.site_id
}

output "rack_id" {
  description = "ID do rack onde o device está instalado"
  value       = netbox_device.this.rack_id
}

output "rack_position" {
  description = "Posição do device no rack"
  value       = netbox_device.this.rack_position
}

output "rack_face" {
  description = "Face do rack onde o device está instalado"
  value       = netbox_device.this.rack_face
}

output "status" {
  description = "Status do device"
  value       = netbox_device.this.status
}

output "tenant_id" {
  description = "ID do tenant proprietário do device"
  value       = netbox_device.this.tenant_id
}

output "serial" {
  description = "Número de série do device"
  value       = netbox_device.this.serial
}

output "asset_tag" {
  description = "Tag de ativo do device"
  value       = netbox_device.this.asset_tag
}

output "description" {
  description = "Descrição do device"
  value       = netbox_device.this.description
}

output "tags" {
  description = "Lista de tags do device"
  value       = netbox_device.this.tags
}
