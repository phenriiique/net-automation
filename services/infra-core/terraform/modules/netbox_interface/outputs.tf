output "id" {
  description = "ID da interface"
  value       = netbox_device_interface.this.id
}

output "name" {
  description = "Nome da interface"
  value       = netbox_device_interface.this.name
}

output "type" {
  description = "Tipo da interface"
  value       = netbox_device_interface.this.type
}

output "enabled" {
  description = "Se a interface está habilitada"
  value       = netbox_device_interface.this.enabled
}

output "description" {
  description = "Descrição da interface"
  value       = netbox_device_interface.this.description
}

output "mode" {
  description = "Modo da interface"
  value       = netbox_device_interface.this.mode
}

output "untagged_vlan" {
  description = "ID da VLAN não marcada"
  value       = netbox_device_interface.this.untagged_vlan
}

output "tagged_vlans" {
  description = "Lista de IDs das VLANs marcadas"
  value       = netbox_device_interface.this.tagged_vlans
}
