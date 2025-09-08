output "id" {
  description = "ID do VLAN group no Netbox"
  value       = netbox_vlan_group.this.id
}

output "name" {
  description = "Nome do VLAN group"
  value       = netbox_vlan_group.this.name
}

output "slug" {
  description = "Slug do VLAN group"
  value       = netbox_vlan_group.this.slug
}

output "description" {
  description = "Descrição do VLAN group"
  value       = netbox_vlan_group.this.description
}

output "tags" {
  description = "Tags do VLAN group"
  value       = netbox_vlan_group.this.tags
}

output "vid_ranges" {
  description = "Ranges de VLAN IDs"
  value       = netbox_vlan_group.this.vid_ranges
}
