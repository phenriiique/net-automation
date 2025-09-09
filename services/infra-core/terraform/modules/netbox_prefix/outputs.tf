output "id" {
  description = "ID do prefixo no Netbox"
  value       = netbox_prefix.this.id
}

output "prefix" {
  description = "Prefixo CIDR"
  value       = netbox_prefix.this.prefix
}

output "status" {
  description = "Status do prefixo"
  value       = netbox_prefix.this.status
}

output "description" {
  description = "Descrição do prefixo"
  value       = netbox_prefix.this.description
}

output "site_id" {
  description = "ID do site"
  value       = netbox_prefix.this.site_id
}

output "tenant_id" {
  description = "ID do tenant"
  value       = netbox_prefix.this.tenant_id
}

output "vlan_id" {
  description = "ID da VLAN"
  value       = netbox_prefix.this.vlan_id
}

output "is_pool" {
  description = "Se é um pool de endereços"
  value       = netbox_prefix.this.is_pool
}

output "role_id" {
  description = "ID do papel (role)"
  value       = netbox_prefix.this.role_id
}

output "tags" {
  description = "Tags do prefixo"
  value       = netbox_prefix.this.tags
}
