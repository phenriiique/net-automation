output "id" {
  description = "ID da VLAN no Netbox"
  value       = netbox_vlan.this.id
}

output "name" {
  description = "Nome da VLAN"
  value       = netbox_vlan.this.name
}

output "vid" {
  description = "VLAN ID"
  value       = netbox_vlan.this.vid
}

output "status" {
  description = "Status da VLAN"
  value       = netbox_vlan.this.status
}

output "description" {
  description = "Descrição da VLAN"
  value       = netbox_vlan.this.description
}

output "tenant_id" {
  description = "ID do tenant"
  value       = netbox_vlan.this.tenant_id
}

output "site_id" {
  description = "ID do site"
  value       = netbox_vlan.this.site_id
}

output "group_id" {
  description = "ID do VLAN group"
  value       = netbox_vlan.this.group_id
}

output "tags" {
  description = "Tags da VLAN"
  value       = netbox_vlan.this.tags
}
